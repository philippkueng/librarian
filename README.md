# Librarian

[![Circle CI](https://circleci.com/gh/philippkueng/librarian/tree/master.svg?style=svg)](https://circleci.com/gh/philippkueng/librarian/tree/master)

A prototype for a unified search application across cloud services.

## Development

1. Install dependencies with `mix deps.get`
2. Creating the database and load the migrations

```bash
mix ecto.create
mix ecto.migrate
```

3. Start Phoenix endpoint with `foreman start -e .env_dev`

Now you can visit `localhost:5000` from your browser.
