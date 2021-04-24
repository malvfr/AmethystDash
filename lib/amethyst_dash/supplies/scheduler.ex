defmodule AmethystDash.Supplies.Scheduler do
  use GenServer
  alias AmethystDash.Supplies.ExpirationNotification

  # CLIENT

  def start_link(state \\ %{}) do
    GenServer.start_link(__MODULE__, state)
  end

  # SERVER

  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 1000)
  end
end
