defmodule Librarian.Mixfile do
  use Mix.Project

  def project do
    [app: :librarian,
     version: "0.0.1",
     elixir: "~> 1.0.4",
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
     applications: application_list(Mix.env)]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.15"},
     {:phoenix_ecto, "~> 0.4"},
     {:postgrex, "~> 0.8.1"},
     {:phoenix_live_reload, "~> 0.4"},
     {:phoenix_html, "~> 1.0"},
     {:cowboy, "~> 1.0.0"},
     {:oauth2, "~> 0.1.1"},
     {:passport, "~> 0.0.3"},
     {:dotenv, "~> 1.0.0"},
     {:hound, "~> 0.7.2", only: :test},
     {:httpoison, "~> 0.7"}]
  end

  defp application_list(:dev), do: [:dotenv | application_list]
  defp application_list(:test), do: [:hound | application_list]
  defp application_list(_), do: application_list
  defp application_list, do: [:phoenix, :cowboy, :logger, :ecto, :oauth2, :httpoison]

end
