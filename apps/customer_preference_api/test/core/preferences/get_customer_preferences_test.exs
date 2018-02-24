defmodule Core.Preferences.GetCustomerPreferencesTest do
  use ExUnit.Case

  test "fetches preferences from database" do
    {:ok, result} = Core.Preferences.GetCustomerPreferences.for("1")

    assert result.id == "uuid-1"
    assert result.preferences["events"]["byEmail"]["status"] == false
    assert result.preferences["events"]["byPost"]["status"] == true
  end
end
