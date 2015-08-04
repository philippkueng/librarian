defmodule Librarian.Repo.Migrations.AddApiKeyColumnToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :api_key, :string
    end
  end
end
