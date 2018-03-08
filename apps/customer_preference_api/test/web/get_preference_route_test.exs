defmodule GetPreferenceRouteTest do
  use ExUnit.Case
  use Plug.Test

  import Mox
  @mock_request Database.MockRequest

  @opts Routes.Router.init([])

  test "GET /customers/uuid-1 returns successfully" do
    expect(@mock_request, :request, fn _ -> {:ok, canned_result()} end)

    conn = conn(:get, "/customers/uuid-1")

    response = Routes.Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body =~ "preferences"
    assert response.resp_body =~ "accommodation"
    assert response.resp_body =~ "apartment"
    assert response.resp_body =~ "hotel"
  end

  def canned_result do
    %{"Item" =>
      %{"id" => %{"S" => "uuid-1"},
        "preferences" => %{"M" =>
          %{"accommodation" => %{"M" =>
            %{"apartment" => %{"M" =>
              %{"bedrooms" => %{"N" => "2"},
                "catering" => %{"S" => "self_catering"},
                "parking" => %{"S" => "secure"}}},
              "hotel" => %{"M" => %{"bedrooms" => %{"N" => "1"},
                "catering" => %{"S" => "catered"},
                "parking" => %{"S" => "secure"}}}}}}}}}
  end
end
