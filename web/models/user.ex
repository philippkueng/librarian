defmodule Librarian.User do
  use Librarian.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :crypted_password, :string

    has_many :services, Librarian.Service

    timestamps
  end

  @required_fields ~w(email
                      crypted_password)
  @optional_fields ~w(name)

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
