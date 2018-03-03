defmodule Plugs.GetCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    # validate the url parameters
    preferences = Controllers.PreferenceController.get_preferences(conn.path_params["id"])
    send_resp(conn, 200, Poison.encode!(preferences))
  end
end
