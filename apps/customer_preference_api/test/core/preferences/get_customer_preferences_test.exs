defmodule Core.Preferences.GetCustomerPreferencesTest do
  use ExUnit.Case
  import Mox
  @mock_request Database.MockRequest


  test "fetches preferences from database" do
    expect(@mock_request, :request, fn _ -> {:ok, canned_result()} end)

    {:ok, result} = Core.Preferences.GetCustomerPreferences.for("1")

    assert result.id == "uuid-1"
    assert result.preferences["events"]["byEmail"]["status"] == false
    assert result.preferences["events"]["byPost"]["status"] == true
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
