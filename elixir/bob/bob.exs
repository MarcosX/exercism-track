defmodule Teenager do
  def hey(input) do
    cond do
      ignored?(input) -> "Fine. Be that way!"
      questioned?(input) -> "Sure."
      nonsense?(input) -> "Whatever."
      yelled?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp ignored?(input) do
    String.trim(input) == ""
  end

  defp questioned?(input) do
    String.ends_with?(input, "?")
  end

  defp nonsense?(input) do
    String.match?(input, ~r/^(\d|,|\s)+$/)
  end

  defp yelled?(input) do
    input == String.upcase(input)
  end
end
