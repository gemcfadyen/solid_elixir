defmodule CustomerPreferenceApi do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Routes.Router, [], port: 8090)
    ]

    Logger.info("Started application")
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
