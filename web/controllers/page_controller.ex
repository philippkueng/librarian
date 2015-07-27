defmodule Librarian.PageController do
  use Librarian.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
