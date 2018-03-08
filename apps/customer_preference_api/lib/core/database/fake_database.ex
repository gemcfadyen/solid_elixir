defmodule Database.FakeDatabase do
  @behaviour Database.Request

  @impl true
  def request(op, config_overrides \\ [])

  @impl true
  def request(%{http_method: :post}, _) do
    {:ok, canned_result()}
  end

  def canned_result do
    IO.puts("Saving data...")

    %{"Item" =>
      %{"id" => %{"S" => "uuid-1"},
        "preferences" => %{"M" =>
          %{"accommodation" => %{"M" =>
            %{"apartment" => %{"M" =>
              %{"bedrooms" => %{"N" => "2"},
                "catering" => %{"S" => "self_catering"},
                "parking" => %{"S" => "secure"}}},
              "hotel" => %{"M" => %{"bedrooms" => %{"N" => "1"},
                "catering" => %{"S" => "catered"},
                "parking" => %{"S" => "secure"}}}}}}}}}
  end
end
