defmodule Validation.HeaderValidator do

  def validate(params) do
    parameter_validators = [Validation.RequestParameterValidator,
                            Validation.CustomerRestriction]

    validate_all_rules(parameter_validators, params)
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
