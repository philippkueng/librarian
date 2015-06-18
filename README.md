# Librarian

[![Circle CI](https://circleci.com/gh/philippkueng/librarian/tree/master.svg?style=svg)](https://circleci.com/gh/philippkueng/librarian/tree/master)

A prototype for a unified search application across cloud services.

## Development

* Install dependencies with `mix deps.get`
* Copy the file `.env-dist` to `.env` and fill out all the variables
* Create the database and load the migrations

```bash
mix ecto.create
mix ecto.migrate
```

* Start the Phoenix endpoint with `mix phoenix.server`

Now you can visit [localhost:5000](http://localhost:5000/) from your browser.
