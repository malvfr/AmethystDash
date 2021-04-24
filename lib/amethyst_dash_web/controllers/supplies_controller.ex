defmodule AmethystDashWeb.SuppliesController do
  use AmethystDashWeb, :controller

  alias AmethystDash.Supplies.Supply

  alias AmethystDashWeb.FallbackController
  alias AmethystDashWeb.Supplies.SuppliesView

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- AmethystDash.create_supply(params) do
      conn
      |> put_status(:created)
      |> put_view(SuppliesView)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- AmethystDash.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> put_view(SuppliesView)
      |> render("show.json", supply: supply)
    end
  end
end
