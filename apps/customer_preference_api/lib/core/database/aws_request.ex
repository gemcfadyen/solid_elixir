defmodule Database.AwsRequest do
  @behaviour Database.Request

  @impl true
  def request(op, config_overrides \\ []) do
    ExAws.request(op, config_overrides)
  end
end
