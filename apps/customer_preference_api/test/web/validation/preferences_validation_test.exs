defmodule Validation.PreferencesValidationTest do
  use ExUnit.Case

  test "request has missing preferences" do
    response = Validation.PreferencesValidation.has_preferences(%{})
    assert response == {:error, :no_preferences}
  end

  test "request has preferences" do
    response = Validation.PreferencesValidation.has_preferences(%{"preferences" => %{}})
    assert response == :ok
  end
end
