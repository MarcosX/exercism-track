defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.split(sentence, ~r/(\s|_)/)
      |> group_elements
  end

  defp group_elements(elements) do
    Enum.reject(elements, fn(e) -> !String.match?(e, ~r/\w+/) end)
      |> Enum.map(fn(e) ->
        String.downcase(e)
          |> String.split("")
          |> Enum.reject(fn(c) -> !String.match?(c, ~r/(\w|-)/) end)
          |> Enum.join
        end)
      |> Enum.reduce(%{}, fn(element, acc) ->
        Map.put(acc, element, (acc[element] || 0) + 1)
      end)
  end
end
