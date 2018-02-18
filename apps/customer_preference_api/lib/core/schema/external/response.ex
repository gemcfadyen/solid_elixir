defmodule Core.Schema.External.Response do

  def format({:ok, database_response}) do
    pretty_response = database_response
    # Data formatting to create a nice response for calling system
    pretty_response
  end

  def format({:created, database_response}) do
    pretty_response = database_response
    # Data formatting to create a nice response for calling system
    pretty_response
  end
end
