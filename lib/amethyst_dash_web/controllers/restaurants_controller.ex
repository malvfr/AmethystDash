defmodule AmethystDashWeb.RestaurantsController do
  use AmethystDashWeb, :controller

  alias AmethystDash.Restaurants.Restaurant

  alias AmethystDashWeb.FallbackController
  alias AmethystDashWeb.Restaurants.RestaurantsView

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- AmethystDash.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> put_view(RestaurantsView)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
