defmodule PlugPrayerFlag do
  @default_header_name "flag"
  @default_header_value "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔"

  def init(opts) do
    %{
      header_name: Keyword.get(opts, :header_name, @default_header_name),
      header_value: Keyword.get(opts, :header_value, @default_header_value),
    }
  end

  def call(conn, %{header_name: header_name, header_value: header_value}) do
    Plug.Conn.put_resp_header(conn, header_name, header_value)
  end
end
