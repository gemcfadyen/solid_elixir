defmodule Validation.CustomerRestriction do
  @behaviour Validation

  def is_valid(params) do
    if params["id"] == "uuid-1" do
      {:ok, params["id"]}
    else
      {:error, {:restricted, "Customer is restricted"}}
    end
  end
end
