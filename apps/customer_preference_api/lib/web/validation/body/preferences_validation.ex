defmodule Validation.Body.PreferencesValidation do
  @behaviour Validator

  def is_valid(request_body) do
    with {:ok, body} <- has_preferences_section(request_body) do
      {:ok, body}
    else
      res = {:error, _} -> res
    end
  end

  defp has_preferences_section(body) do
    if not(is_nil(body["preferences"])) do
      {:ok, body}
    else
      {:error, :no_preferences}
    end
  end
end
