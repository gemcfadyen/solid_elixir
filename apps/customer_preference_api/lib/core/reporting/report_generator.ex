defmodule Core.Reporting.ReportGenerator do

  @spec generate_report(data :: map, formats :: [Core.Reporting.Formatter]) :: atom
  def generate_report(data, formats) do
    formatted_reports = Enum.map(formats, fn(format) ->
      format.format_to_rows(data)
      # if a specific type do something extra
    end)

    dispatch(formatted_reports)
  end

  def dispatch(reports) do
    IO.inspect("send to external systems")
    :ok
  end
end

# Run in repl
