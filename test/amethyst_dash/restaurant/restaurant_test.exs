defmodule AmethystDash.Restaurants.RestaurantTest do
  use AmethystDash.DataCase
  alias AmethystDash.Restaurants.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "Returns a valid message when params are valid" do
      params = %{name: "Restaurant1", email: "res@res.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{name: "Restaurant1", email: "res@res.com"}, valid?: true} = response
    end

    test "Returns a valid message when params aren't valid" do
      params = %{name: "Restaurant1"}
      expected_response = %{email: ["can't be blank"]}


      response = Restaurant.changeset(params)
      assert %Changeset{valid?: false} = response

      assert errors_on(response) ==  expected_response
    end
  end
end
