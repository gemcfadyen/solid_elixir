defmodule Core.Reporting.HistoricalDataReport do
  @behaviour Core.Reporting.Formatter

  @impl true
  def format_to_rows(data) do
    formatted_data = data
    IO.inspect("format for historical data")
    #... some data clensing and reformatting logic
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
