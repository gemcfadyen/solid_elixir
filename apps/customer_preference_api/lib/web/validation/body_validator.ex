defmodule Validation.BodyValidator do

  def validate(body) do
    body_validators = [Validation.Body.PreferencesValidation,
                       Validation.Body.MarketingValidation]

    validate_all_rules(body_validators, body)
  end

  defp validate_all_rules([], body) do
    {:ok, body}
  end
  defp validate_all_rules([head|tail], body) do
    {status, data} = head.is_valid(body)
    if status == :error do
      {:error, data}
    else
      validate_all_rules(tail, body)
    end
  end
end
