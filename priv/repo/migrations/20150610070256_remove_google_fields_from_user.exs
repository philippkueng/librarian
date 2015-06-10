defmodule Librarian.Repo.Migrations.RemoveGoogleFieldsFromUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :google_client_id
      remove :google_client_secret
      remove :google_refresh_token
    end
  end
end
