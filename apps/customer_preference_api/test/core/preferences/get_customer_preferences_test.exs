defmodule Core.Preferences.GetCustomerPreferencesTest do
  use ExUnit.Case
  import Mox
  @mock_request Database.MockRequest


  test "fetches preferences from database" do
    expect(@mock_request, :request, fn _ -> {:ok, canned_result()} end)

    {:ok, result} = Core.Preferences.GetCustomerPreferences.for("1")

    assert result.id == "uuid-1"
    assert result.preferences["accommodation"]["apartment"]["bedrooms"] == 2
    assert result.preferences["accommodation"]["hotel"]["catering"] == "catered"
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
