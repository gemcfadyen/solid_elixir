defmodule Validation.PreferencesValidation do
  def has_preferences(request_body) do
    with :ok <- has_preferences_section(request_body) do
      :ok
    else
      res = {:error, _} -> res
    end
  end

  defp has_preferences_section(body) do
    if not(is_nil(body["preferences"])) do
      :ok
    else
      {:error, :no_preferences}
    end
  end
end
