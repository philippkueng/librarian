defmodule Librarian.Repo.Migrations.AddGoogleOauthFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :google_client_id, :string
      add :google_client_secret, :string
      add :google_refresh_token, :string
    end
  end
end
