defmodule Validation.HeaderValidator do
  @type ok_tuple :: {status :: atom, data :: String.t}
  @type reason_tuple :: {status :: atom, reason :: String.t}
  @type error_tuple :: {status :: atom, reason :: reason_tuple}
  @type validators :: [Validation]

  @spec validate(params :: map, header_validators :: validators) :: ok_tuple | error_tuple
  def validate(params, header_validators) do
    validate_all_rules(header_validators, params)
  end

  defp validate_all_rules([], params) do
    {:ok, params["id"]}
  end
  defp validate_all_rules([head|tail], params) do
    {status, data} = head.is_valid(params)

    if status == :error do
      {:error, data}
    else
      validate_all_rules(tail, params)
    end
  end
end
