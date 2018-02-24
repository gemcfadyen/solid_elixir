defmodule Core.Preferences.GetCustomerPreferences do
  @aws_request Application.get_env(:customer_preference_api, :aws_request)

  def for(customer_id) do
    ExAws.Dynamo.get_item("customer-preferences", %{id: customer_id})
    |> @aws_request.request
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
end
