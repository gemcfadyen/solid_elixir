defmodule Validation.RequestParameterValidationTest do
  use ExUnit.Case

  test "request has invalid url params" do
    response = Validation.RequestParameterValidator.is_valid(%{"glob" => ["£££"], "id" => "£££"})
    assert response == {:error, {:invalid_url_params, "URL Parameters need to be alpha numeric"}}
  end

   test "request has valid url params" do
    response = Validation.RequestParameterValidator.is_valid(%{"glob" => ["uuid-1"], "id" => "uuid-1"})
    assert response == {:ok, "uuid-1"}
   end
end
