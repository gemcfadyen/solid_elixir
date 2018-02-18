defmodule Routes.CustomerRoutes do
  use Plug.Router

#  plug Plug.Parsers, parsers: [:json],
#   json_decoder: Poison

  plug :match

  get("/:id", to: Plugs.GetCustomer)
  post("/:id", to: Plugs.SaveCustomer)

  match _, do: send_resp(conn, 404, "Route Not Found\n")

  plug :dispatch
end
