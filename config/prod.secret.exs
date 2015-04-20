use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :librarian, Librarian.Endpoint,
  secret_key_base: "p6uxgeGn0jnIS8kpTtZzlIA8mBnH52hhaYHt/Fwxl5R1BonaAROP42StlwN144iD"

# Configure your database
config :librarian, Librarian.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "librarian_prod"
