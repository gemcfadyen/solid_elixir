defmodule Plugs.SaveCustomer do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    # validate request
    #
    # does it have alphanumeric customer id as a header
    # does it have a body
    # does the body contain both marketing and event information
    # if so go ahead and process

    with {:ok, customer_id} <- Validation.RequestParameterValidation.has_valid_parameters(conn.path_name),
         {:ok, valid_request} <- Validation.RequestBodyValidation.is_valid(conn.resp_body) do

          response = Controllers.SavePrefernceController.save_preferences(customer_id, valid_request)
           send_resp(conn, 201, Poison.encode!(response))
    else
      {:error, {:invalid_url_params, res}} -> send_resp(conn, 400, Poison.encode!(%{error: res}))
      {:error, {:no_marketing, res}} -> send_resp(conn, 400, Poison.encode!(%{error: res}))
      {:error, {:no_events, res}} -> send_resp(conn, 400, Poison.encode!(%{error: res}))
    end

  end
end
