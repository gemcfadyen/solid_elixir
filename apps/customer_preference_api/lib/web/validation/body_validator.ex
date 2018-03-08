defmodule Validation.BodyValidator do
  @type ok_tuple :: {status :: atom, data :: String.t}
  @type reason_tuple :: {status :: atom, reason :: String.t}
  @type error_tuple :: {status :: atom, reason :: reason_tuple}
  @type validators :: [Validation]

  @spec validate(body:: map, header_validators :: validators) :: ok_tuple | error_tuple
  def validate(body, body_validators) do
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
