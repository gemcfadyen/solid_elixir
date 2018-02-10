defmodule Plugs.GetCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    IO.inspect("have hit the end point!")
    send_resp(conn, 200, Poison.encode!("hello"))
    # validate the url parameters

    # calls to a domain thing to fetch the record
    # the format is different to what we want to provide back to the user
    # reformat the data
    # send response
    #
    # how hard to test all those combinations
  end
end
