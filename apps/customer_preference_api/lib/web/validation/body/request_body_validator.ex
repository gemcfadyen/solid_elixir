defmodule Validation.RequestBodyValidator do
  @behaviour Validator

  def is_valid(request_body) do
    with :ok <- has_preferences(request_body),
         :ok <- has_marketing_preferences(request_body),
         :ok <- has_event_preferences(request_body) do
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

  defp has_marketing_preferences(body) do
    if not(is_nil(body["preferences"]["marketing"])) do
      :ok
    else
      {:error, {:no_marketing, "Marketing section missing"}}
    end
  end

  defp has_event_preferences(body) do
    if not(is_nil(body["preferences"]["events"])) do
      :ok
    else
      {:error, {:no_events, "Event section missing"}}
    end
  end

  def format_to_internal_request(body) do
    body
  end
end
