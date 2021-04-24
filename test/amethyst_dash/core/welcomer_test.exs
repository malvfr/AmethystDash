defmodule AmethystDash.WelcomerTest do
  use ExUnit.Case
  alias AmethystDash.Core.Welcomer

  describe "greet/1" do
    test "Test greet message when user is over 18" do
      params = %{"name" => "bob", "age" => "20"}

      result = Welcomer.greet(params)
      expected = {:ok, "Hello, #{Map.get(params, "name")}"}
      assert result == expected
    end

    test "Test greet message when user is under 18" do
      params = %{"name" => "bob", "age" => "17"}

      result = Welcomer.greet(params)
      expected = {:error, "#{Map.get(params, "name")} is not authorized"}
      assert result == expected
    end
  end
end
