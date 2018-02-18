defmodule Validation.HeaderValidator do
  def validate(params) do
    parameter_validators = [&Validation.RequestParameterValidator.has_valid_parameters/1,
                            &Validation.CustomerRestriction.unrestricted/1]

    Enum.map(parameter_validators, fn(header_validation) ->
      {status, data} = header_validation.(params)

      if status == :error do
        {:error, data}
      end
    end)

    {:ok, params["id"]}
  end
end
