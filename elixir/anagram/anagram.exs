defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &(same_chars_but_not_equal(base, &1)))
  end

  defp same_chars_but_not_equal(base, candidate) do
    String.downcase(base) != String.downcase(candidate) &&
      sort_string_chars(base) == sort_string_chars(candidate)
  end

  defp sort_string_chars(string) do
    String.downcase(string)
    |> String.split("")
    |> Enum.sort
    |> Enum.join
  end
end
