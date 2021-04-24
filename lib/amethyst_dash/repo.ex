defmodule AmethystDash.Repo do
  use Ecto.Repo,
    otp_app: :amethyst_dash,
    adapter: Ecto.Adapters.Postgres
end
