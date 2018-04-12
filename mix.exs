defmodule PlugPrayerFlag.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_prayer_flag,
     version: "1.0.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}, # required for publishin on hex.pm
      {:plug, "~> 1.4"},
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
