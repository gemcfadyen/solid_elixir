defmodule Validation.BodyValidator do
  def validate(body) do
    body_validators = [&Validation.RequestBodyValidator.is_valid/1]

    Enum.map(body_validators, fn(body_validation) ->
      {status, data} = body_validation.(body)
      if status == :error do
        {:error, data}
      end
    end)
    {:ok, body}
  end
end
