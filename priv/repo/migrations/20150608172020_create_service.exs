defmodule Librarian.Repo.Migrations.CreateService do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :provider, :string
      add :client_id, :string
      add :client_secret, :string
      add :refresh_token, :string

      timestamps
    end

  end
end
