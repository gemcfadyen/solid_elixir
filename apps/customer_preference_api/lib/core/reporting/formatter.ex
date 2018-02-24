defmodule Core.Reporting.Formatter do
  @callback format_to_rows([map]) :: {:ok, [map]} | {:error, String.t}

  @callback add_disclaimer([map]) :: [map]

  @callback add_header([map]) :: [map]

  @callback colour([map]) :: [map]
end
