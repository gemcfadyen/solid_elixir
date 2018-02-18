defmodule Validation.CustomerRestriction do
  @behaviour Validation

  def is_valid(customer_id) do
    if customer_id == "uuid-1" do
      {:ok, customer_id}
    else
      {:error, {:restricted, "Customer is restricted"}}
    end
  end
end
