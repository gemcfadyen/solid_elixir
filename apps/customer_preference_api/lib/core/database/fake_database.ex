defmodule FakeDatabase do
  def request(data) do
    IO.puts("Saving data...")
    canned_result = %{"Item" =>
      %{"id" => %{"S" => "uuid-1"},
        "preferences" => %{"M" =>
          %{"accommodation" => %{"M" =>
            %{"apartment" => %{"M" =>
              %{"catering" => %{"S" => "self_catering"},
                "bedrooms" => %{"N" => 2},
                "parking" => %{"S" => "secure"}}},
              "hotel" => %{"M" =>
                %{"catering" => %{"S" => "self_catering"},
                  "bedrooms" => %{"N" => 1},
                  "parking" => %{"S" => "secure"}}}}}}}}}

    {:ok, canned_result}
  end
end
