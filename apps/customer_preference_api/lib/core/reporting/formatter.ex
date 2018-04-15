defmodule Core.Reporting.Formatter do
    @callback format_to_rows(map) :: {:ok, map} | {:error, String.t}
end
