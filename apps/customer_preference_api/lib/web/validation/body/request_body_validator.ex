defmodule Validation.RequestBodyValidator do
  @behaviour Validation

  @impl true
  def is_valid(request_body) do
    with :ok <- has_preferences(request_body),
         :ok <- has_accommodation_preferences(request_body) do
           {:ok, format_to_internal_request(request_body)}
    else
      res = {:error, _} -> res
    end
  end

  defp has_preferences(body) do
    if not(is_nil(body["preferences"])) do
      :ok
    else
      {:error, {:no_preferences, "Preferences section missing"}}
    end
  end

  defp has_accommodation_preferences(body) do
    if not(is_nil(body["preferences"]["accommodation"])) do
      :ok
    else
      {:error, {:no_accommodation, "Accommodation section missing"}}
    end
  end

  def format_to_internal_request(body) do
    body
  end
end
