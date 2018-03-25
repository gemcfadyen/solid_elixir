defmodule Validation.CustomerRestriction do

  def unrestricted(params) do
    if params["id"] == "uuid-1" do
      {:ok, params}
    else
      {:error, {:restricted, "Customer is restricted"}}
    end
  end
end
