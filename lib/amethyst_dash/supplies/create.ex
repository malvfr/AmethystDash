defmodule AmethystDash.Supplies.Create do
  alias AmethystDash.Repo
  alias AmethystDash.Supplies.Supply

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Supply{} = result}) do
    {:ok, result}
  end

  defp handle_insert({:error, result}) do
    {:error, %{result: result, status: :bad_request}}
  end
end
