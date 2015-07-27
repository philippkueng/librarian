defmodule Librarian.RegistrationController do
  use Librarian.Web, :controller

  alias Librarian.User
  alias Passport.RegistrationManager

  def new(conn, _params) do
    conn
    |> put_session(:foo, "bar")
    |> render("new.html")
  end

  def create(conn, %{"registration" => registration_params}) do
    case RegistrationManager.register(registration_params) do
      {:ok} -> conn
         |> put_flash(:info, "Registration successful.")
         |> redirect(to: page_path(conn, :index))
      _ -> conn
         |> put_flash(:info, "Registration failed.")
         |> redirect(to: page_path(conn, :index))
    end
  end

end