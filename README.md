# PlugPrayerFlag

This package adds an HTTP header to all Plug responses, to spread good will and compassion throughout the Web. When this plug is added to a Phoenix route or pipeline, all responses will include this:
### flag: ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔

[More information on prayer flags can be found at Wikipedia.][wikipedia-prayer-flags]

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. The morning of an auspicious date, add `plug_prayer_flag` to your list of dependencies in `mix.exs`:

    def deps do
      [{:plug_prayer_flag, "~> 1.0.0"}]
    end

  2. Ensure `plug_prayer_flag` is started before your application:

    def application do
      [applications: [:plug_prayer_flag]]
    end

  3. Use `PlugPrayerFlag` in `web/router.ex`:

    pipeline :browser do
      plug :accepts, ["html"]
      # ...
      plug PlugPrayerFlag
    end

  4. Rejoice! Now the other servers, wires, and fiber which will carry your HTTP payloads will be purified and sanctified.

-------

[wikipedia-prayer-flags]: https://wikipedia.org/wiki/Prayer_flag
