defmodule AmethystDash.Core.Welcomer do
  def greet(%{"name" => name, "age" => age}) do
    name
    |> validate(String.to_integer(age))
  end

  defp validate(name, age) when age >= 18 do
    {:ok, "Hello, #{name}"}
  end

  defp validate(name, _age) do
    {:error, "#{name} is not authorized"}
  end
end
