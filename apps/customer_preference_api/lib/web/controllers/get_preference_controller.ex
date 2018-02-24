defmodule Controllers.GetPreferenceController do

  def get_preferences(customer_id, database \\ ExAws) do
    Core.Preferences.GetCustomerPreferences.for(customer_id, database)
    |> Core.Schema.External.Response.format()
  end
end

