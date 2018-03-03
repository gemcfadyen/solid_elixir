defmodule Validation.Body.AccommodationValidation do
  @behaviour Validator

  def is_valid(request_body) do
    with {:ok, body} <- has_accommodation_section(request_body) do
      {:ok, body}
    else
      res = {:error, _} -> res
    end
  end

  defp has_accommodation_section(body) do
    if not(is_nil(body["preferences"]["accommodation"])) do
      {:ok, body}
    else
      {:error, :no_accommodation}
    end
  end
end
