defmodule Librarian.User do
  use Librarian.Web, :model

  import Ecto.Query
  alias Librarian.Repo
  alias Librarian.Service

  schema "users" do
    field :name, :string
    field :email, :string
    field :crypted_password, :string
    field :api_key, :string

    has_many :services, Librarian.Service

    timestamps
  end

  @required_fields ~w(email
                      crypted_password)
  @optional_fields ~w(name
                      api_key)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def get_services(user_id) do
    Repo.all(
      from s in Service,
      where: s.user_id == ^user_id
    )
  end
end
