defmodule Validation.AccomomodationValidationTest do
  use ExUnit.Case

  test "request has missing accommodation section" do
    response = Validation.AccommodationValidation.has_accommodation_preferences(%{"preferences" => %{}})
    assert response == {:error, :no_accommodation}
  end

  test "request has accommodation section" do
    response = Validation.AccommodationValidation.has_accommodation_preferences(%{"preferences" => %{"accommodation" => %{}}})
    assert response == :ok
  end
end
