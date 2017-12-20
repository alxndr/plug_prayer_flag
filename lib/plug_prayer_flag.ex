defmodule PlugPrayerFlag do
  def init(opts), do: opts

  def call(conn, _) do
    Plug.Conn.put_resp_header(conn, "flag", "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔")
  end
end
