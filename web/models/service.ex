defmodule Librarian.Service do
  use Librarian.Web, :model

  schema "services" do
    field :provider, :string
    field :client_id, :string
    field :client_secret, :string
    field :refresh_token, :string
    field :provider_identificator, :string

    belongs_to :user, Librarian.User

    timestamps
  end

  @required_fields ~w(provider client_id client_secret refresh_token user_id provider_identificator)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
