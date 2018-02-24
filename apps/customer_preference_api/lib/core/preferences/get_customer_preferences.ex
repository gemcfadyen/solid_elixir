defmodule Core.Preferences.GetCustomerPreferences do

  def for(customer_id, database \\ ExAws) do
    ExAws.Dynamo.get_item("customer-preferences", %{id: customer_id})
    |> database.request
    |> decode
  end

  defp decode({:ok, response}) when map_size(response) == 0 do
    {:error, :not_found}
  end
  defp decode({:ok, response}) do
    IO.inspect(response)
    valid_consent_user = ExAws.Dynamo.decode_item(response, as: Schema.Database.CustomerPreferencesRow)

    {:ok, valid_consent_user}
  end
  defp decode({:error, response}) do
    {:error, response}
  end
end
