defmodule Validation.PreferencesValidationTest do
  use ExUnit.Case

  test "request has missing preferences" do
    response = Validation.Body.PreferencesValidation.is_valid(%{})
    assert response == {:error, :no_preferences}
  end

  test "request has preferences" do
    body = %{"preferences" => %{}}
    response = Validation.Body.PreferencesValidation.is_valid(body)
    assert response == {:ok, body}
  end
end
