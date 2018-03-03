defmodule Core.Preferences.Decode do

  def decode({:ok, response}) when map_size(response) == 0 do
    {:error, :not_found}
  end
  defp decode({:ok, response}) do
    valid_preferences = ExAws.Dynamo.decode_item(response, as: Schema.Database.CustomerPreferencesRow)

    {:ok, valid_preferences}
  end
  defp decode({:error, response}) do
    {:error, response}
  end
end
