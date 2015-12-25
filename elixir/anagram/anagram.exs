defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, fn(candidate) ->
      String.downcase(candidate) != String.downcase(base) &&
        sort_string(base) == sort_string(candidate)
    end) 
  end

  defp sort_string(string) do
    String.downcase(string)
    |> String.split("")
    |> Enum.sort
    |> Enum.join
  end
end
