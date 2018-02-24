defmodule Core.Reporting.ReportGenerator do

  @spec generate_report(data :: map, formats :: list) :: atom
  def generate_report(data, formats) do
    formatted_reports = Enum.map(formats, fn(format) ->
      format.format_to_rows(data)
      # if a specific type do something extra
      # run in repl without and with this, if you only
      # have historical report here it will work fine but add another one theh you are in problem area
      #format.add_disclaimer()
    end)
    dispatch(formatted_reports)
  end

  def dispatch(reports) do
    IO.inspect("send to external systems")
    :ok
  end
end
