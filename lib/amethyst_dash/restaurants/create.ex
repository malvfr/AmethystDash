defmodule AmethystDash.Restaurants.Create do
  alias AmethystDash.Repo
  alias AmethystDash.Restaurants.Restaurant

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant{} = result}) do
    {:ok, result}
  end

  defp handle_insert({:error, result}) do
    {:error, %{result: result, status: :bad_request}}
  end
end
