defmodule Librarian.Repo.Migrations.AddEmailColumnToServices do
  use Ecto.Migration

  def change do
    alter table(:services) do
      add :provider_identificator, :string
    end
  end
end
