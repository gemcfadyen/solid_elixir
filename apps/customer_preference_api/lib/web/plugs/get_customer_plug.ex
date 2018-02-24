defmodule Plugs.GetCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    database = ExAws
    preferences = Controllers.GetPreferenceController.get_preferences(conn.path_params["id"], database)
    send_resp(conn, 200, Poison.encode!(preferences))
  end
end
