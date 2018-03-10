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

  @spec present_report(formatted_data :: map, presenters:: list) :: atom
  def present_report(formatted_data, presenters) do
    formatted_reports = Enum.map(presenters, fn(presenter) ->
      presenter.add_disclaimer()
      |> presenter.add_header()
      |> presenter.colour()
      |> dispatch
    end)
  end

  def dispatch(reports) do
    IO.inspect("send to external systems")
    :ok
  end
end
