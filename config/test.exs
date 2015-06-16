use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :librarian, Librarian.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :librarian, Librarian.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "librarian_test",
  size: 1,
  max_overflow: false
