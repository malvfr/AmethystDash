defmodule AmethystDash.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AmethystDash.Repo,
      # Start the Telemetry supervisor
      AmethystDashWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AmethystDash.PubSub},
      # Start the Endpoint (http/https)
      AmethystDashWeb.Endpoint,
      # Start a worker by calling: AmethystDash.Worker.start_link(arg)
      # {AmethystDash.Worker, arg}
      AmethystDash.Supplies.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AmethystDash.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AmethystDashWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
