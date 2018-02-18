defmodule Validation.RequestParameterValidationTest do
  use ExUnit.Case

  test "request has invalid url params" do
    response = Validation.RequestParameterValidator.has_valid_parameters(%{"glob" => ["£££"], "id" => "£££"})
    assert response == {:error, {:invalid_url_params, "Url parameters must be alphanumeric"}}
  end

   test "request has valid url params" do
    response = Validation.RequestParameterValidator.has_valid_parameters(%{"glob" => ["uuid-1"], "id" => "uuid-1"})
    assert response == {:ok, "uuid-1"}
   end
end
