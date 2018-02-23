defmodule Validation.Body.MarketingValidation do
  @behaviour Validation

  def is_valid(request_body) do
    with {:ok, body} <- has_marketing_section(request_body) do
      {:ok, body}
    else
      res = {:error, _} -> res
    end
  end

  defp has_marketing_section(body) do
    if not(is_nil(body["preferences"]["marketing"])) do
      {:ok, body}
    else
      {:error, :no_marketing}
    end
  end
end
