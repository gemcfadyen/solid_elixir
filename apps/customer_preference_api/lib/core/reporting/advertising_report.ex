defmodule Core.Reporting.AdvertisingReport do
  @behaivour Core.Reporting.Formatter

  def format_to_rows(data) do
    formatted_data = data
    IO.inspect("format for advertising")
    #... some data clensing and reformatting logic
    {:ok, formatted_data}
  end
end
