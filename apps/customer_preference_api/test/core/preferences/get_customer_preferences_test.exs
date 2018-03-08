defmodule Core.Preferences.GetCustomerPreferencesTest do
  use ExUnit.Case

  test "fetches preferences from database" do
    {:ok, result} = Core.Preferences.GetCustomerPreferences.for("1", FakeDatabase)

    assert result.id == "uuid-1"
    assert result.preferences["accommodation"]["apartment"]["catering"] == "self_catering"
    assert result.preferences["accommodation"]["hotel"]["parking"] == "secure"
  end
end
