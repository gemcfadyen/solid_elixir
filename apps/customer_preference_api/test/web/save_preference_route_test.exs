defmodule SavePreferenceRouteTest do
  use ExUnit.Case
  use Plug.Test

  @opts Routes.Router.init([])

  test "POST /customers/uuid-1 returns successfully" do
    conn = conn(:post, "/customers/uuid-1", http_body())

    response = Routes.Router.call(conn, @opts)

    assert response.status == 201
  end

  test "POST /customers/invalid -id returns 400" do
    conn = conn(:post, "/customers/invalid -id", http_body())

    response = Routes.Router.call(conn, @opts)

    assert response.status == 400
  end

  test "POST /customers/id with malformed body returns 400" do
    conn = conn(:post, "/customers/invalid -id", %{})

    response = Routes.Router.call(conn, @opts)

    assert response.status == 400
  end

  defp http_body() do
    %{"id" => "uuid-1",
      "preferences" =>
      %{"accommodation" =>
        %{"apartment" => %{
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
