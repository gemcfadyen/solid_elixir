defmodule Core.Reporting.HistoricalDataDecorator do
  @behaviour Core.Reporting.Formatter

  @impl true
  def format_to_rows(data) do
    IO.inspect("format for historical data")
    formatted_data = Core.Reporting.HistoricalDataReport.format_to_rows(data)
                     |> add_disclaimer()
                     |> add_header()
                     |> colour()
    {:ok, formatted_data}
  end

  def add_disclaimer(data) do
    IO.inspect("..adding disclaimer..")
    #...adds legal disclaimer
    data
  end

  def add_header(data) do
    IO.inspect("..adding header..")
    data
  end

  def colour(data) do
    IO.inspect("..adding colour..")
    data
  end
end
