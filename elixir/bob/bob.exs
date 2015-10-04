defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      String.match?(input, ~r/^(\d|,|\s)+$/) -> "Whatever."
      input == String.upcase(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
