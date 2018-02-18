defmodule Plugs.SaveCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    body = conn.body_params

    with {:ok, customer_id} <- Validation.RequestParameterValidator.has_valid_parameters(conn.path_params),
         {:ok, customer_id} <- Validation.CustomerRestriction.unrestricted(customer_id),
         {:ok, valid_request} <- Validation.RequestBodyValidator.is_valid(body) do

           response = Controllers.SavePreferenceController.save_preferences(customer_id, valid_request)
           send_resp(conn, 201, Poison.encode!(response))
    else
      {:error, {_, reason}} -> send_resp(conn, 400, Poison.encode!(%{error: reason}))
    end
  end
end
