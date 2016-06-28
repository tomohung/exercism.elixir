defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s,-]/)
    |> Enum.map(fn(x) -> if Regex.match?(~r/[A-Z]+/, x), do: x, else: String.capitalize(x) end)
    |> Enum.map(fn(x) -> String.split(x, ~r/[a-z\s]/, trim: true) end)
    |> List.to_string
  end
end
