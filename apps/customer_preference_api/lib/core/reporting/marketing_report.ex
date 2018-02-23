defmodule Core.Reporting.MarketingReport do
  @behaivour Core.Reporting.Formatter

  def format_to_rows(data) do
    formatted_data = data
    IO.inspect("Format marketing report")
    #... some data clensing and reformatting logic
    {:ok, formatted_data}
  end
end
