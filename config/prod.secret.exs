use Mix.Config

defmodule Heroku do
  def database_config(uri) do
    parsed_uri = URI.parse(uri)
    [username, password] = parsed_uri.userinfo
                          |> String.split(":")
    [_, database] = parsed_uri.path
                    |> String.split("/")

    [{:username, username},
     {:password, password},
     {:hostname, parsed_uri.host},
     {:database, database},
     {:port, parsed_uri.port},
     {:adapter, Ecto.Adapters.Postgres}]
  end
end

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :librarian, Librarian.Endpoint,
  secret_key_base: "p6uxgeGn0jnIS8kpTtZzlIA8mBnH52hhaYHt/Fwxl5R1BonaAROP42StlwN144iD"

# Configure your database
config :librarian, Librarian.Repo,
  "DATABASE_URL"
  |> System.get_env
  |> Heroku.database_config
