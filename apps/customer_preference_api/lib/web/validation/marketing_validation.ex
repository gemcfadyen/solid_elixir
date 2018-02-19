defmodule Validation.MarketingValidation do

  def has_marketing(request_body) do
    with :ok <- has_marketing_section(request_body) do
      :ok
    else
      res = {:error, _} -> res
    end
  end

  defp has_marketing_section(body) do
    if not(is_nil(body["preferences"]["marketing"])) do
      :ok
    else
      {:error, :no_marketing}
    end
  end

end
