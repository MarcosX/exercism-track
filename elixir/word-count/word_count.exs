defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.split(sentence, ~r/(\s|_)/)
      |> Enum.reject(fn(word) -> !String.match?(word, ~r/\w+/) end)
      |> group_words
  end

  defp group_words(words) do
    clear_non_word_characters(words)
      |> Enum.reduce(%{}, fn(word, acc) ->
        Map.put(acc, word, (acc[word] || 0) + 1)
      end)
  end

  defp clear_non_word_characters(words) do
    Enum.map(words, fn(word) ->
      String.downcase(word)
      |> String.split("")
      |> Enum.reject(fn(char) -> !String.match?(char, ~r/(\w|-)/) end)
      |> Enum.join
    end)
  end
end
