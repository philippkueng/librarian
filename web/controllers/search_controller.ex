defmodule Librarian.SearchController do
  use Librarian.Web, :controller
  alias Librarian.Service

  def index(conn, _params) do
    json conn, %{results: Repo.all(Service)}
  end
end
