defmodule Core.Preferences.GetCustomerPreferences do

  def for(customer_id) do
    ExAws.Dynamo.get_item("customer-preferences", %{id: customer_id})
    |> ExAws.request
    |> decode
  end

  defp decode({:ok, response}) when map_size(response) == 0 do
    {:error, :not_found}
  end
  defp decode({:ok, response}) do
    valid_consent_user = ExAws.Dynamo.decode_item(response, as: Schema.Database.CustomerPreferencesRow)

    {:ok, valid_consent_user}
  end
  defp decode({:error, response}) do
    {:error, response}
  end

  def temp do
    data =
      %{"customerId" => "uuid-1",
        "preferences" => %{
          "accommodation" => %{
            "apartment" => %{
              "catering" => "self_catering",
              "bedrooms" => 2,
              "parking" => "secure"
            },
            "hotel" => %{
              "catering" => "catered",
              "bedrooms" => 1,
              "parking" => "none"
            }
          }
        }
      }
    Poison.encode!(data)
    |> Poison.decode!
  end
end
