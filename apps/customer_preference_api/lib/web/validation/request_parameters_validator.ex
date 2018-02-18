defimpl Validator, for: Validation.ReqeustParameterValidator do

  def validate(params) do
    if valid?(params), do: {:ok, params["id"]}, else: {:error, {:invalid_url_params, "URL Parameters need to be alpha numeric"}}
  end

  def valid?(%{"glob" => path_parameter_values}) do
    path_parameter_values
    |> Enum.all?(fn(parameter) -> alpha_numeric?(parameter) end)
  end

  defp alpha_numeric?(parameter) do
    String.match?(parameter, ~r/^[0-9a-zA-z-]+$/u)
  end

end
