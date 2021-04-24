defmodule AmethystDashWeb.Restaurants.RestaurantsView do
  use AmethystDashWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created",
      restaurant: restaurant
    }
  end
end
