defmodule Routes.CustomerRoutes do
  use Plug.Router

  plug :match

  get("/:id", to: Plugs.GetCustomer)

  match _, do: send_resp(conn, 404, "Route Not Found\n")

  plug :dispatch
end
