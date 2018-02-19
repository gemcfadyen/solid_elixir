defmodule Plugs.SaveCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    path_params = conn.path_params
    body = conn.body_params

    header_validators = Application.get_env(:customer_preference_api, :header_validators)
    body_validators = Application.get_env(:customer_preference_api, :body_validators)

    with {:ok, customer_id} <- Validation.HeaderValidator.validate(path_params, header_validators),
         {:ok, body} <- Validation.BodyValidator.validate(body, body_validators) do
           valid_body = Schema.Http.Request.new!(body, customer_id, body["version"])
           response = Controllers.SavePreferenceController.save_preferences(customer_id, valid_body)
           send_resp(conn, 201, Poison.encode!(response))
    else
      {:error, {_, reason}} -> send_resp(conn, 400, Poison.encode!(%{error: reason}))
    end
  end

end
