defimpl Validator, for: Validation.CustomerRestriction do

  def validate(customer_id) do
    if customer_id == "uuid-1" do
      {:ok, customer_id}
    else
      {:error, {:restricted, "Customer is restricted"}}
    end
  end
end
