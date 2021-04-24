defmodule AmethystDash do
  alias AmethystDash.Restaurants.Create, as: RestaurantCreate
  alias AmethystDash.Supplies.Create, as: SupplyCreate
  alias AmethystDash.Supplies.Get, as: SupplyGet
  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
