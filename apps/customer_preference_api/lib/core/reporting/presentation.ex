defmodule Reporting.Presentation do
  @callback add_disclaimer([map]) :: [map]

  @callback add_header([map]) :: [map]

  @callback colour([map]) :: [map]
end
