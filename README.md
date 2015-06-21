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

## Tests

In order to run the tests locally make sure you have selenium-server-standalone installed and running. (easiest via homebrew)

```bash
brew update
brew install selenium-server-standalone
selenium-server -p 4444 # to start it on port 4444
```

Then you're ready to run the tests with mix.

```bash
mix test
```
