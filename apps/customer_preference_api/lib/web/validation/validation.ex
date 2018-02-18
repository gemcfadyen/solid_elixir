defmodule Validation do
    @callback is_valid(map) :: {:ok, term} | {:error, {atom, reason :: String.t}}
end
