defmodule Librarian.PageControllerTest do
  use Librarian.ConnCase
  use ExUnit.Case
  use Hound.Helpers

  hound_session

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Librarian"
  end

  test "GET / with selenium" do
    navigate_to("/")
    assert page_title() == "Librarian"
    assert page_source =~ "Login"
    assert page_source =~ "Signup"
  end

end
