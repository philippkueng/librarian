defmodule Librarian.ProfileController do
  use Librarian.Web, :controller

  alias Librarian.User

  def show(conn, _params) do
    user_id = get_session(conn, :current_user)
    user = Repo.get(User, user_id)
    render conn, "show.html", user: user
  end

  def edit(conn, _params) do
    user_id = get_session(conn, :current_user)
    user = Repo.get(User, user_id)
    changeset = User.changeset(user)
    render conn, "edit.html", user: user, changeset: changeset
  end
end
