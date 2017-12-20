defmodule PlugPrayerFlag.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_prayer_flag,
     version: "1.0.0-rc",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:plug, "~> 1.4"},
    ]
  end

  defp package do
    [
      maintainers: ["alxndr+hex.pm-package@gmail.com"],
      licenses: ["GPL-3.0+"],
      links: %{"GitHub" => "https://github.com/alxndr/plug_prayer_flag"},
      source_url: "https://github.com/alxndr/plug_prayer_flag",
    ]
  end
end
