defmodule Librarian.Authentication.GoogleController do
  use Librarian.Web, :controller
  alias Librarian.User
  alias Librarian.Service

  import Ecto.Query

  @doc """
  This action is reached via `/auth` and redirects to the OAuth2 provider
  based on the chosen strategy.
  """
  def index(conn, _params) do
    redirect conn, external: Google.authorize_url!
  end

  @doc """
  This action is reached via `/auth/callback` is the the callback URL that
  the OAuth2 provider will redirect the user back to with a `code` that will
  be used to request an access token. The access token will then be used to
  access protected resources on behalf of the user.
  """
  def callback(conn, %{"code" => code}) do
    # Exchange an auth code for an access token
    token = Google.get_token!(code: code)

    # Extract the attributes that need to be saved to the database
    %{client: %{client_id: client_id,
                client_secret: client_secret},
      refresh_token: refresh_token} = token

    # Extract the user_id from the session
    user_id = get_session(conn, :current_user)

    # Request the user's data with the access token
    user_data = OAuth2.AccessToken.get!(token, "/oauth2/v1/userinfo")

    # Fetch the current user from the database
    user = Repo.get(User, get_session(conn, :current_user))

    # Check if that user already has a Google Service connected
    # Get all services for current user
    service = Repo.one(
      from s in Service,
      where: s.user_id == ^user_id,
      where: s.provider == "google",
      where: s.client_id == ^client_id
    )

    # Helper function to return a service struct in case no service entry is being returned.
    service_or_empty_struct = fn ->
      if service do
        service
      else
        %Service{}
      end
    end

    changeset = Service.changeset(
      service_or_empty_struct.(), %{
        provider: "google",
        client_id: client_id,
        client_secret: client_secret,
        refresh_token: refresh_token,
        user_id: user_id
      })

    if service do
      # The service is already connected, therefore update the entry.
      if changeset.valid? do
        Repo.update!(changeset)

        conn
        |> put_flash(:info, "Google credentials were successfully updated")
        |> redirect(to: page_path(conn, :index))
      else
        conn
        |> put_flash(:error, "Couldn't update the Google credentials.")
        |> redirect(to: page_path(conn, :index))
      end

    else
      # Insert a new service entry for that user.

      if changeset.valid? do
        Repo.insert(changeset)

        conn
        |> put_flash(:info, "Google was successfully connected.")
        |> redirect(to: page_path(conn, :index))

      else
        conn
        |> put_flash(:error, "Couldn't authenticate with Google.")
        |> redirect(to: page_path(conn, :index))
      end
    end

    # Store the user in the session under `:current_user` and redirect to /.
    # In most cases, we'd probably just store the user's ID that can be used
    # to fetch from the database. In this case, since this example app has no
    # database, I'm just storing the user map.
    #
    # If you need to make additional resource requests, you may want to store
    # the access token as well.
    conn
    |> put_session(:current_user_google, user_data)
    |> put_session(:access_token, token.access_token)
    |> redirect(to: "/")
  end
end
