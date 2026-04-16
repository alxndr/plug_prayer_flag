defmodule PlugPrayerFlagTest do
  use ExUnit.Case, async: true
  import Plug.Test
  import Plug.Conn

  doctest PlugPrayerFlag

  test "preserves `conn` status" do
    conn =
      conn(:get, "/")
      |> put_status(200)
      |> PlugPrayerFlag.call(%{})
    assert 200 == conn.status
  end

  test "adds flag header" do
    %{resp_headers: headers} =
      conn(:get, "/")
      |> put_status(200)
      |> PlugPrayerFlag.call(%{})
    assert Enum.any?(headers, fn({name, _value}) -> name === "flag" end)
  end
end
