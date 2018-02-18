defmodule Controllers.PreferenceController do

  def get_preferences(customer_id) do
    ExAws.Dynamo.get_item("customer-preferences", %{id: customer_id})
    |> ExAws.request
    |> decode
  end
  defp decode({:ok, response}) when map_size(response) == 0 do
    {:error, :not_found}
  end
  defp decode({:ok, response}) do
    valid_consent_user = ExAws.Dynamo.decode_item(response, as: Schema.Database.CustomerPreferencesRow)
                         |> format_response()

    {:ok, valid_consent_user}
  end
  defp decode({:error, response}) do
    {:error, response}
  end

  def format_response(raw_response) do
    pretty_response = raw_response
    # Data formatting to create a nice response for calling system
    pretty_response
  end
end

