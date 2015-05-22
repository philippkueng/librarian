defmodule Librarian.PageControllerTest do
  use Librarian.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Librarian"
  end
end
