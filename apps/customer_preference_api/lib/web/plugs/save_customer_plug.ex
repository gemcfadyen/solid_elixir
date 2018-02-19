defmodule Plugs.SaveCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    body = conn.body_params
    with {:ok, customer_id} <- Validation.RequestParameterValidation.has_valid_parameters(conn.path_params),
         :ok <- Validation.PreferencesValidation.has_preferences(body),
         :ok <- Validation.MarketingValidation.has_marketing(body) do
           #:ok <- Validation.EventsValidation.has_events(body) do

           valid_request = Schema.Http.Request.new!(body, customer_id, body["version"])
           response = Controllers.SavePreferenceController.save_preferences(customer_id, valid_request)
           send_resp(conn, 201, Poison.encode!(response))
    else
      {:error, :invalid_url_params} -> send_resp(conn, 400, Poison.encode!(%{error: "URL Parameters need to be alpha numeric"}))
      {:error, :no_preferences} -> send_resp(conn, 400, Poison.encode!(%{error: "Preferences section missing"}))
      {:error, :no_marketing}  -> send_resp(conn, 400, Poison.encode!(%{error: "Marketing section missing"}))
      #{:error, :no_events} -> send_resp(conn, 400, Poison.encode!(%{error: "Events section missing"}))
    end
  end
end
