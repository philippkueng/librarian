defmodule Librarian.ServiceTest do
  use Librarian.ConnCase

  alias Librarian.Service

  @valid_attrs %{
    client_id: "some content",
    client_secret: "some content",
    provider: "some content",
    refresh_token: "some content",
    user_id: 1,
    provider_identificator: "some content"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Service.changeset(%Service{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Service.changeset(%Service{}, @invalid_attrs)
    refute changeset.valid?
  end
end
