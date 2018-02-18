defmodule Schema.Database.CustomerPreferencesRow do
  @enforce_keys [:id, :version, :preferences]
  @type timestamp::pos_integer
  @type t::%__MODULE__{id: String.t, version: integer, createDate: timestamp, lastModified: timestamp, preferences: map}
  defstruct [:id, :version, :createDate, :lastModified, :preferences]

  def new!(preference_data) do
    %Schema.Database.CustomerPreferencesRow{
      id: preference_data["id"],
      version: preference_data["version"],
      createDate: preference_data["createDate"],
      lastModified: preference_data["lastModified"],
      preferences: preference_data["preferences"]
    }
  end
end
