defmodule Controllers.PreferenceController do

  def get_preferences(customer_id) do
    Core.Preferences.GetCustomerPreferences.for(customer_id)
    |> Core.Schema.External.Response.format()
  end
end

