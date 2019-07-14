defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, ~r{(\s|-|[a-z](?=[A-Z]))})
    |> Enum.map(&(captilize_first_letter(&1)))
    |> Enum.join
  end

  defp captilize_first_letter(string) do
    String.capitalize(String.first(string))
  end
end
