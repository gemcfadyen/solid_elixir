defmodule Database.FakeDatabase do
  @behaviour Database.Request

  @impl true
  def request(op, config_overrides \\ [])

  @impl true
  def request(%{http_method: :post}, _) do
    {:ok, canned_result()}
  end

  def canned_result do
    %{"Item" =>
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
  end
end
