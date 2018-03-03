defmodule SavePreferenceRouteTest do
  use ExUnit.Case
  use Plug.Test

  @opts Routes.Router.init([])

  test "POST /customers/uuid-1 returns successfully" do
    conn = conn(:post, "/customers/uuid-1", http_body())

    response = Routes.Router.call(conn, @opts)

    assert response.status == 201
  end

  defp http_body() do
    %{"customerId" => "uuid-1",
      "preferences" =>
      %{"accommodation" =>
        %{"appartment" => %{
          "catering" => "self_catering",
          "bedrooms" => 2,
          "parking" => "secure"
        },
          "house" =>
          %{"catering" => "self_catering",
            "bedrooms" => 1,
            "parking" => "secure"
          }
        }
      }
    }
  end
end




