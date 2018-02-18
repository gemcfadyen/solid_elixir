defmodule Plugs.SaveCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    path_params = conn.path_params
    body = conn.body_params

    with {:ok, customer_id} <- validate_headers(path_params),
         {:ok, valid_body} <- validate_body(body) do

           response = Controllers.SavePreferenceController.save_preferences(customer_id, valid_body)
           send_resp(conn, 201, Poison.encode!(response))
    else
      {:error, {_, reason}} -> send_resp(conn, 400, Poison.encode!(%{error: reason}))
         end
  end

  def validate_headers(params) do
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


  def validate_body(body) do
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
