defmodule Librarian.Repo.Migrations.AddUserIdColumnToServicesTable do
  use Ecto.Migration

  def change do
    alter table(:services) do
      add :user_id, :integer
    end
  end
end
