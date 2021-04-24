defmodule AmethystDashWeb.Restaurants.RestaurantsViewTest do
  use AmethystDashWeb.ConnCase
  alias AmethystDash.Restaurants.Restaurant
  alias AmethystDashWeb.Restaurants.RestaurantsView

  import Phoenix.View

  describe "render/2" do
   test "Renders create.json" do
     params = %{name: "Restaurant1", email: "res@res.com"}
     {:ok, restaurant} = AmethystDash.create_restaurant(params)

     response = render(RestaurantsView, "create.json", restaurant: restaurant)

     assert %{message: "Restaurant created", restaurant: %Restaurant{email: "res@res.com", name: "Restaurant1"}} = response
   end
  end
 end
