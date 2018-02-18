defmodule Core.Preferences.StoreCustomerPreferences do

  @type response_tuple :: {status :: atom, data :: %Schema.Database.CustomerPreferencesRow{}}
  @type error_tuple :: {status :: atom, reason :: atom}

  @spec save(id :: String.t, customer_preferences:: %Schema.Http.Request{}) :: response_tuple | error_tuple
  def save(id, customer_preferences) do
    persisted_data = customer_preferences
    #...save the customer preferences
    {:created, persisted_data}
  end
end

