# Minimal pipelines that reflect how an end user would add this plug to their app.
defmodule TestPipelineDefaults do
  use Plug.Builder
  plug PlugPrayerFlag
end

defmodule TestPipelineCustomHeaderName do
  use Plug.Builder
  plug PlugPrayerFlag, header_name: "x-mantra"
end

defmodule TestPipelineCustomHeaderValue do
  use Plug.Builder
  plug PlugPrayerFlag, header_value: "om mani padme hum"
end

defmodule TestPipelineBothCustom do
  use Plug.Builder
  plug PlugPrayerFlag, header_name: "x-mantra", header_value: "om mani padme hum"
end

defmodule PlugPrayerFlagTest do
  use ExUnit.Case, async: true
  import Plug.Test
  import Plug.Conn

  doctest PlugPrayerFlag

  @default_opts PlugPrayerFlag.init([])

  test "preserves `conn` status" do
    conn =
      conn(:get, "/")
      |> put_status(200)
      |> PlugPrayerFlag.call(@default_opts)
    assert 200 == conn.status
  end

  test "with no options, adds a 'flag' header with the mantra as value" do
    %{resp_headers: headers} =
      conn(:get, "/")
      |> PlugPrayerFlag.call(PlugPrayerFlag.init([]))
    {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "flag" end)
    assert value === "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔"
  end

  test "adds flag header by default" do
    %{resp_headers: headers} =
      conn(:get, "/")
      |> put_status(200)
      |> PlugPrayerFlag.call(@default_opts)
    assert Enum.any?(headers, fn({name, _value}) -> name === "flag" end)
  end

  test "default header value is the mantra" do
    %{resp_headers: headers} =
      conn(:get, "/")
      |> PlugPrayerFlag.call(@default_opts)
    {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "flag" end)
    assert value === "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔"
  end

  test "custom header_name is used" do
    opts = PlugPrayerFlag.init(header_name: "x-mantra")
    %{resp_headers: headers} =
      conn(:get, "/")
      |> PlugPrayerFlag.call(opts)
    assert Enum.any?(headers, fn({name, _value}) -> name === "x-mantra" end)
    refute Enum.any?(headers, fn({name, _value}) -> name === "flag" end)
  end

  test "custom header_value is used" do
    opts = PlugPrayerFlag.init(header_value: "om")
    %{resp_headers: headers} =
      conn(:get, "/")
      |> PlugPrayerFlag.call(opts)
    {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "flag" end)
    assert value === "om"
  end

  test "custom header_name and header_value can both be set" do
    opts = PlugPrayerFlag.init(header_name: "x-mantra", header_value: "om mani padme hum")
    %{resp_headers: headers} =
      conn(:get, "/")
      |> PlugPrayerFlag.call(opts)
    {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "x-mantra" end)
    assert value === "om mani padme hum"
  end

  describe "used as a plug in a pipeline" do
    test "without config, uses 'flag' and Tibetan mantra" do
      %{resp_headers: headers} =
        conn(:get, "/")
        |> TestPipelineDefaults.call(TestPipelineDefaults.init([]))
      {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "flag" end)
      assert value === "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔"
    end

    test "with header_name, uses it with Tibetan mantra" do
      %{resp_headers: headers} =
        conn(:get, "/")
        |> TestPipelineCustomHeaderName.call(TestPipelineCustomHeaderName.init([]))
      {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "x-mantra" end)
      assert value === "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔"
    end

    test "with header_value, uses 'flag' header with it" do
      %{resp_headers: headers} =
        conn(:get, "/")
        |> TestPipelineCustomHeaderValue.call(TestPipelineCustomHeaderValue.init([]))
      {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "flag" end)
      assert value === "om mani padme hum"
    end

    test "with header_name and header_value, uses both" do
      %{resp_headers: headers} =
        conn(:get, "/")
        |> TestPipelineBothCustom.call(TestPipelineBothCustom.init([]))
      {_name, value} = Enum.find(headers, fn({name, _value}) -> name === "x-mantra" end)
      assert value === "om mani padme hum"
    end
  end
end
