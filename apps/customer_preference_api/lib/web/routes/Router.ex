defmodule Routes.Router do
 use Plug.Router

   use Plug.ErrorHandler

   plug :match

   forward "/customers", to: Routes.CustomerRoutes
   match _, do: send_resp(conn, 404, "Route Not Found\n")

   plug :dispatch

end
