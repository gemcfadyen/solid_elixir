defmodule Controllers.SavePreferenceController do

  def save_preferences(customer_id, preferences) do
    Core.Preferences.SaveCustomerPreferences.save(customer_id, preferences)
    |> Core.Schema.External.Response.format()
  end
end

