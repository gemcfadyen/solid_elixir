defmodule Builder.BuilderTest do
  use ExUnit.Case
  alias Builder.HttpRequestBuilder

  # which is more readible
  # which is more / less code
  # in java is it the same contrast?
  # in this case i think without the builder is better
  test "builds user preferences" do
    http_request_body =
      HttpRequestBuilder.body()
      |> HttpRequestBuilder.with_customer_id("uuid-1")
      |> HttpRequestBuilder.with_preference("marketing", "byPost")
      |> HttpRequestBuilder.with_status("marketing", "byPost", true)
      |> HttpRequestBuilder.with_third_party_status("marketing", "byPost", true)
      |> HttpRequestBuilder.with_preference("marketing", "byEmail")
      |> HttpRequestBuilder.with_status("marketing", "byEmail", false)
      |> HttpRequestBuilder.with_third_party_status("marketing", "byEmail", false)
      |> HttpRequestBuilder.with_preference("events", "byPost")
      |> HttpRequestBuilder.with_status("events", "byPost", true)
      |> HttpRequestBuilder.with_third_party_status("events", "byPost", false)
      |> HttpRequestBuilder.with_preference("events", "byEmail")
      |> HttpRequestBuilder.with_status("events", "byEmail", false)
      |> HttpRequestBuilder.with_third_party_status("events", "byEmail", false)

    assert http_request_body ==
      %{"customerId" => "uuid-1",
        "preferences" =>
        %{"marketing" =>
          %{
            "byPost" => %{
              "status" => true,
              "thirdParty" => true
            },
            "byEmail" => %{
              "status" => false,
              "thirdParty" => false
            }
          },
          "events" =>
          %{
            "byPost" => %{
              "status" => true,
              "thirdParty" => false
            },
            "byEmail" => %{
              "status" => false,
              "thirdParty" => false
            }
          }
        }
      }
  end

  # Depending on what you are testing, will determine whether you need to set each fields explicitly.
  # For some tests we may just need a request, and not care so much about what the details are of each request
  # In those cases, the size of the builder reduces, and it hiding the details of the message perhaps doesn't matter so much as it is not the detail in the message that we are testing at that point
  test "http body with default statuses" do
    http_request_body =
      HttpRequestBuilder.body()
      |> HttpRequestBuilder.with_customer_id("uuid-1")
      |> HttpRequestBuilder.with_preference("marketing", "byPost")

    assert http_request_body ==
      %{"customerId" => "uuid-1",
        "preferences" =>
        %{"marketing" =>
          %{
            "byPost" => %{
              "status" => false,
              "thirdParty" => false
            }
          }
        }
      }
  end
end
