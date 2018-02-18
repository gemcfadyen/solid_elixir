defmodule GetPreferenceRouteTest do
  use ExUnit.Case
  use Plug.Test

  @opts Routes.Router.init([])

  test "GET /customers/uuid-1 returns successfully" do
    conn = conn(:get, "/customers/uuid-1")

    response = Routes.Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body =~ "preferences"
    assert response.resp_body =~ "marketing"
    assert response.resp_body =~ "events"
    assert response.resp_body =~ "byEmail"
    assert response.resp_body =~ "byPost"
  end
end
