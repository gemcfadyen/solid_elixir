defmodule FakeDatabase do
  def request(data) do
    IO.puts("Saving data...")
    canned_result = %{"Item" =>
      %{"id" => %{"S" => "uuid-1"},
        "preferences" => %{"M" =>
          %{"events" => %{"M" =>
            %{"byEmail" => %{"M" =>
              %{"status" => %{"BOOL" => false},
                "thirdParty" => %{"BOOL" => false}}},
              "byPost" => %{"M" =>
                %{"status" => %{"BOOL" => true},
                  "thirdParty" => %{"BOOL" => false}}}}},
            "marketing" => %{"M" =>
              %{"byEmail" => %{"M" =>
                %{"status" => %{"BOOL" => false},
                  "thirdParty" => %{"BOOL" => false}}},
                "byPost" => %{"M" =>
                  %{"status" => %{"BOOL" => true},
                    "thirdParty" => %{"BOOL" => true}}}}}}}}}

    {:ok, canned_result}
  end
end
