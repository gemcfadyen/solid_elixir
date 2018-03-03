defmodule Validation.AccommodationValidation do

  def has_accommodation_preferences(request_body) do
    with :ok <- has_accommodation_section(request_body) do
      :ok
    else
      res = {:error, _} -> res
    end
  end

  defp has_accommodation_section(body) do
    if not(is_nil(body["preferences"]["accommodation"])) do
      :ok
    else
      {:error, :no_accommodation}
    end
  end
end
