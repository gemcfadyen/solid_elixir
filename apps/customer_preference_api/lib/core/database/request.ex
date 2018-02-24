defmodule Database.Request do
  @callback request(ExAws.Operation.t, Keyword.t) :: {:ok, term} | {:error, term}
  @callback request(ExAws.Operation.t) :: {:ok, term} | {:error, term}
end
