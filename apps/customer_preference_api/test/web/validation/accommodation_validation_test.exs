defmodule Validation.AccommodationValidationTest do
  use ExUnit.Case

  test "request has missing accommodation section" do
    response = Validation.Body.AccommodationValidation.is_valid(%{"preferences" => %{}})
    assert response == {:error, :no_accommodation}
  end

  test "request has accommodation section" do
    body = %{"preferences" => %{"accommodation" => %{}}}
    response = Validation.Body.AccommodationValidation.is_valid(body)
    assert response == {:ok, body}
  end
end
