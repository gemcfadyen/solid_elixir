defmodule Validation.MarketingValidationTest do
  use ExUnit.Case

  test "request has missing marketing section" do
    response = Validation.MarketingValidation.has_marketing(%{"preferences" => %{}})
    assert response == {:error, :no_marketing}
  end

  test "request has marketing section" do
    response = Validation.MarketingValidation.has_marketing(%{"preferences" => %{"marketing" => %{}}})
    assert response == :ok
  end

end
