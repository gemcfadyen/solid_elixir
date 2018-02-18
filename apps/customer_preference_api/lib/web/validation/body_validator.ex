defmodule Validation.BodyValidator do

  def validate(body) do
    body_validators = [Validation.RequestBodyValidator]

    Enum.map(body_validators, fn(module_name) ->
      {status, data} = module_name.is_valid(body)
      if status == :error do
        {:error, data}
      end
    end)
    {:ok, body}
  end
end
