defmodule Librarian.SessionControllerTest do
  use Librarian.ConnCase
  use ExUnit.Case
  use Hound.Helpers

  hound_session

  test "fill out login form with wrong password" do
    navigate_to("/login")

    login_element = find_element(:id, "session_email")
    fill_field(login_element, "foo@foo.com")

    password_element = find_element(:id, "session_password")
    fill_field(password_element, "foo")

    submit_element(login_element)

    assert visible_text({:class, "alert-warning"}) == "Email or password incorrect."
  end
end
