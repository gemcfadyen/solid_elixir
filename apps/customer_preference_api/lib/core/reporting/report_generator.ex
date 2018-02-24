defmodule Core.Reporting.ReportGenerator do
  def entry_point() do
    data = [%{}]
    formatted_data = generate_report(data,
                                     [Core.Reporting.MarketingReport,
                                      Core.Reporting.AdvertisingReport,
                                      Core.Reporting.HistoricalDataReport])

    present_report(formatted_data, [Core.Reporting.HistoricalDataReport])
    |> dispatch
  end

  @spec generate_standard_reports(data :: map, formats :: list) :: atom
  def generate_report(data, formats) do
    formatted_reports = Enum.map(formats, fn(format) ->
      format.format_to_rows(data)
    end)
    dispatch(formatted_reports)
  end

  @spec styled_reports(data :: map, presenters:: list) :: atom
  def present_report(formatted_data, presenters) do
    formatted_reports = Enum.map(presenters, fn(presenter) ->
      |> presenter.add_disclaimer()
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
