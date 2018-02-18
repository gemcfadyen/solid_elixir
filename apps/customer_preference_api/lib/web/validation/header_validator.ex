defmodule Validation.HeaderValidator do

  def validate(params) do
    parameter_validators = [Validation.RequestParameterValidator,
                            Validation.CustomerRestriction]

    Enum.map(parameter_validators, fn(module_name) ->
      {status, data} = module_name.is_valid(params)

      if status == :error do
        {:error, data}
      end
    end)

    {:ok, params["id"]}
  end
end
