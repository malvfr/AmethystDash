defmodule AmethystDash.Supplies.ExpirationMail do
  import Bamboo.Email
  alias AmethystDash.Supplies.Supply

  def create(email, supplies) do
    new_email(
      to: email,
      from: "app@app.com",
      subject: "Amethyst dash",
      html_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "-------- Supplies about to expire ------------\n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "<ul> \n" <>
      "<li> \n " <>
      "Description : #{description} \n" <>
      "</li> \n" <>
      "<li> \n" <>
      "Responsible : #{responsible} \n" <>
      "</li> \n" <>
      "<li>" <>
      "Expiration Date : #{expiration_date} \n" <>
      "</li>\n" <>
      "</ul>"
  end
end
