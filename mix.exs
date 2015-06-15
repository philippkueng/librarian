defmodule Librarian.Mixfile do
  use Mix.Project

  def project do
    [app: :librarian,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Librarian, []},
     applications: environment_variables(Mix.env)]
  end

  defp application_list, do: [:phoenix, :cowboy, :logger, :ecto, :oauth2]

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.13"},
     {:phoenix_ecto, "~> 0.4"},
     {:postgrex, "~> 0.8.1"},
     {:phoenix_live_reload, "~> 0.4"},
     {:phoenix_html, "~> 1.0"},
     {:cowboy, "~> 1.0.0"},
     {:oauth2, "~> 0.1.1"},
     {:passport, git: "https://github.com/opendrops/passport.git", ref: "060e1dc3650a4806ec51770e247f5903f6212391"},
     {:dotenv, "~> 1.0.0"},
     {:hound, "~> 0.7.2" }]
  end

  defp environment_variables(:dev), do: [:dotenv | application_list]
  defp environment_variables(_), do: application_list

end
