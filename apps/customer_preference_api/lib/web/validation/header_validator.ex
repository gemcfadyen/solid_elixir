defmodule Validation.HeaderValidator do
  def validate(params) do
    parameter_validators = [&Validation.RequestParameterValidator.has_valid_parameters/1,
                            &Validation.CustomerRestriction.unrestricted/1]

    validate(params, parameter_validators)
  end

  def validate(params, header_validators) do
    validate_all_rules(header_validators, params)
  end

  defp validate_all_rules([], params) do
    {:ok, params["id"]}
  end
  defp validate_all_rules([rule|tail], params) do
    {status, data} = rule.(params)

    if status == :error do
      {:error, data}
    else
      validate_all_rules(tail, params)
    end
  end
end
