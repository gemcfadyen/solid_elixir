defmodule Schema.Http.Request do
  @derive [Poison.Encoder]
  @enforce_keys [:id, :version, :preferences]
  defstruct [:id, :version, :preferences]

  def new!(customer_preferences, id, version) do
    customer_preferences = %Schema.Http.Request{
      id: id,
      version: version,
      preferences: create_preferences(customer_preferences["preferences"])
    }
  end

  defp create_preferences(nil) do
    %{}
  end
  defp create_preferences(preferences) do
    formatted_preferences = preferences
    #..formatting logic
    formatted_preferences
  end
end
