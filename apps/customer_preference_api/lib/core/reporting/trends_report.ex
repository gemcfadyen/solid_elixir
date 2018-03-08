defmodule Core.Reporting.TrendsReport do
  @behaviour Core.Reporting.Formatter

  @impl true
  def format_to_rows(data) do
    formatted_data = data
    IO.inspect("Format trends report")
    #... some data clensing and reformatting logic
    {:ok, formatted_data}
  end
end
