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
    assert response.resp_body =~ "marketing"
    assert response.resp_body =~ "events"
    assert response.resp_body =~ "byEmail"
    assert response.resp_body =~ "byPost"
  end

  def canned_result do
    %{"Item" =>
      %{"id" => %{"S" => "uuid-1"},
        "preferences" => %{"M" =>
          %{"events" => %{"M" =>
            %{"byEmail" => %{"M" =>
              %{"status" => %{"BOOL" => false},
                "thirdParty" => %{"BOOL" => false}}},
              "byPost" => %{"M" =>
                %{"status" => %{"BOOL" => true},
                  "thirdParty" => %{"BOOL" => false}}}}},
            "marketing" => %{"M" =>
              %{"byEmail" => %{"M" =>
                %{"status" => %{"BOOL" => false},
                  "thirdParty" => %{"BOOL" => false}}},
                "byPost" => %{"M" =>
                  %{"status" => %{"BOOL" => true},
                    "thirdParty" => %{"BOOL" => true}}}}}}}}}
  end
end
