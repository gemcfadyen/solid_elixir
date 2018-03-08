defmodule Core.Reporting.LegalReportGenerator do

  def entry_point do
    generate_report([%{"preferences" => %{}}], Core.Reporting.TrendsReport)
  end

  #Adding type spec means you need to be specific about what is being passed in. As far as im aware you can not state that you want a behaviour type in dialyzer
  #  @spec generate_report(data :: list(map()), historical_data_format :: Core.Reporting.MarketingReport) :: :ok
  def generate_report(data, formatter) do
    formatter.format_to_rows(data)
      |> formatter.add_disclaimer
      |> formatter.add_header
      |> formatter.colour
      |> dispatch()
    :ok
  end

  def dispatch(report) do
    IO.inspect("send to external systems")
    :ok
  end
end

# Run in repl
# Can see if we pass a hstorical report into this function it works fine
# but if we pass anaother one in it doesnt work at all and blows up
# dialyzer does not let you declare a behaviour as the type so you need to be exact. however if you dont use typespec then you can be in trouble.
