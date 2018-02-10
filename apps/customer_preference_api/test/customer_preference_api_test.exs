defmodule CustomerPrefernceApiTest do
  use ExUnit.Case
  doctest CustomerPrefernceApi

  test "greets the world" do
    assert CustomerPrefernceApi.hello() == :world
  end
end
