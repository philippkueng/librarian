defmodule Librarian.User do
  use Librarian.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :crypted_password, :string
    field :google_client_id, :string
    field :google_client_secret, :string
    field :google_refresh_token, :string

    timestamps
  end

  @required_fields ~w(email
                      crypted_password)
  @optional_fields ~w(name
                      google_client_id
                      google_client_secret
                      google_refresh_token)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
