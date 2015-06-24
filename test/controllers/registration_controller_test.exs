defmodule Librarian.RegistrationControllerTest do
  use Librarian.ConnCase
  use ExUnit.Case
  use Hound.Helpers

  alias Passport.RegistrationManager

  hound_session

  test "create an account via the register form" do
    navigate_to("/signup")

    login_element = find_element(:id, "registration_email")
    fill_field(login_element, "foo@foo.com")

    password_element = find_element(:id, "registration_password")
    fill_field(password_element, "foo")

    submit_element(login_element)

    assert visible_text({:class, "alert-warning"}) == "Registration successful."
  end
end
