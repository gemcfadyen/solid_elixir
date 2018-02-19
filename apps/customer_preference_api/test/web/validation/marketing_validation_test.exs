defmodule Validation.MarketingValidationTest do
  use ExUnit.Case

  test "request has missing marketing section" do
    response = Validation.Body.MarketingValidation.is_valid(%{"preferences" => %{}})
    assert response == {:error, :no_marketing}
  end

  test "request has marketing section" do
    body = %{"preferences" => %{"marketing" => %{}}}
    response = Validation.Body.MarketingValidation.is_valid(body)
    assert response == {:ok, body}
  end
end
