defmodule AmethystDash.Supplies.ExpirationNotification do
  alias AmethystDash.Core.Mailer
  alias AmethystDash.Supplies.{ExpirationMail, GetByExpirationDate}

  def send do
    data = GetByExpirationDate.call()

    Task.async_stream(data, fn {to_mail, supplies} -> send_email(to_mail, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_mail, supplies) do
    to_mail
    |> ExpirationMail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
