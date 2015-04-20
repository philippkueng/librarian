defmodule Librarian.PageController do
  use Librarian.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
