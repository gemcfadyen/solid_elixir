defmodule GetPreferenceRouteTest do
  use ExUnit.Case
  use Plug.Test

  @opts Routes.Router.init([])

  test "GET /customers/uuid-1 returns successfully" do
    conn = conn(:get, "/customers/uuid-1")

    response = Routes.Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body =~ "preferences"
    assert response.resp_body =~ "accommodation"
    assert response.resp_body =~ "apartment"
    assert response.resp_body =~ "hotel"
  end
end
