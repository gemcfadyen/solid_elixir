defmodule Validation.BodyValidator do
  def validate(body) do
    body_validators = [&Validation.RequestBodyValidator.is_valid/1]
    validate(body, body_validators)
  end

  def validate(body, body_validators) do
    validate_all_rules(body_validators, body)
  end

  defp validate_all_rules([], body) do
    {:ok, body}
  end
  defp validate_all_rules([rule|tail], body) do
    {status, data} = rule.(body)
    if status == :error do
      {:error, data}
    else
      validate_all_rules(tail, body)
    end
  end
end
