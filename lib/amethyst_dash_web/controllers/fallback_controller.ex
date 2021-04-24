defmodule AmethystDashWeb.FallbackController do
  use AmethystDashWeb, :controller
  alias AmethystDashWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
