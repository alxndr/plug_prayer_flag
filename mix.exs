defmodule PlugPrayerFlag.Mixfile do
  use Mix.Project

  def project do
    [
      app: :plug_prayer_flag,
      version: "1.1.0-rc",
      elixir: "~> 1.15", # lowest version of Elixir tested on CI
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
    ]
  end

  def cli do
    [preferred_envs: [
      "test.integration": :test,
    ]]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}, # required for publishing on hex.pm
      {:plug, "~> 1.14"},
    ]
  end

  defp description do
    "This package adds an HTTP header to all Plug responses, to spread good will and compassion throughout the Web."
  end

  defp package do
    [
      maintainers: ["alxndr+hexpm-plugprayerflag@gmail.com"],
      licenses: ["GPL-3.0+"],
      links: %{"GitHub" => "https://github.com/alxndr/plug_prayer_flag"},
      source_url: "https://github.com/alxndr/plug_prayer_flag",
    ]
  end
end
