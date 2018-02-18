defmodule Validation.RequestBodyValidationTest do
  use ExUnit.Case

  test "request has missing preferences" do
    response = Validation.RequestBodyValidator.is_valid(%{})
    assert response == {:error, :no_preferences}
  end

  test "request has missing marketing section" do
    response = Validation.RequestBodyValidator.is_valid(%{"preferences" => %{}})
    assert response == {:error, :no_marketing}
  end

  test "request has missing event section" do
    response = Validation.RequestBodyValidator.is_valid(%{"preferences" => %{"marketing" => %{}}})
    assert response == {:error, :no_events}
  end

  test "valid request" do
    valid_body = %{"preferences" => %{"marketing"=> %{}, "events" => %{}}}
    response = Validation.RequestBodyValidator.is_valid(valid_body)
    assert response == {:ok, valid_body}
  end
end
