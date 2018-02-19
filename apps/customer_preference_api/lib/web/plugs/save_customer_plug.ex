defmodule Plugs.SaveCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    path_params = conn.path_params
    body = conn.body_params

    with {:ok, customer_id} <- Validation.HeaderValidator.validate(path_params),
         {:ok, body} <- Validation.BodyValidator.validate(body) do
           valid_body = Schema.Http.Request.new!(body, customer_id, body["version"])
           response = Controllers.SavePreferenceController.save_preferences(customer_id, valid_body)
           send_resp(conn, 201, Poison.encode!(response))
    else
      {:error, {_, reason}} -> send_resp(conn, 400, Poison.encode!(%{error: reason}))
    end
  end

end
