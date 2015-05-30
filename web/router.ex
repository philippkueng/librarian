defmodule Librarian.Router do
  use Phoenix.Router

  import Passport.AuthenticationPlug
  pipeline :authentication do
    plug :require_login, [
      flash_key: :info,
      flash_msg: "You must be logged in.",
      redirect_to: "/login"
    ]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Librarian do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController

    # Login & Registration
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/signup", RegistrationController, :new
    post "/signup", RegistrationController, :create
  end

  scope "/authentication", Librarian do
    pipe_through [:browser, :authentication]

    scope "/github", Authentication do
      get "/", GithubController, :index
      get "/callback", GithubController, :callback
    end

    scope "/google", Authentication do
      get "/", GoogleController, :index
      get "/callback", GoogleController, :callback
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Librarian do
  #   pipe_through :api
  # end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end
end
