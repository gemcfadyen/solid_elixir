defmodule Core.Reporting.ReportGenerator do
  def entry_point() do
    data = [%{}]
    formatted_data = generate_report(data,
                                     [Core.Reporting.TrendsReport,
                                      Core.Reporting.AdvertisingReport])

    present_report(data, [Core.Reporting.HistoricalDataReport])
    |> dispatch
  end

  @spec generate_report(data :: map, formats :: list) :: atom
  def generate_report(data, formats) do
    formatted_reports = Enum.map(formats, fn(format) ->
      format.format_to_rows(data)
    end)
    dispatch(formatted_reports)
  end

  @spec present_report(data :: map, presenter_formats:: list) :: atom
  def present_report(data, presenter_formats) do
    formatted_reports = Enum.map(presenter_formats, fn(presenter_format) ->
      presenter_format.format_to_rows(data)
      |> presenter_format.add_disclaimer()
      |> presenter_format.add_header()
      |> presenter_format.colour()
      |> dispatch
    end)
  end

  def dispatch(reports) do
    IO.inspect("send to external systems")
    :ok
  end
end
