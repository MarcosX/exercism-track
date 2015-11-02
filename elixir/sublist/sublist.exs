defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b do
    :equal
  end

  def compare([], _b) do
    :sublist
  end

  def compare(_a, []) do
    :superlist
  end

  def compare(a, b) do
    cond do
      length(a) <= length(b) ->
        if beginning_of_match(a, b), do: :sublist, else: :unequal
      length(a) > length(b) ->
        if beginning_of_match(b, a), do: :superlist, else: :unequal
    end
  end

  defp beginning_of_match([x | at], [x | bt]) do
    if(is_sublist([[x|at], [x|bt]])) do
      true
    else
      beginning_of_match([x|at], bt)
    end
  end

  defp beginning_of_match(a, [_ | bt]) do
    beginning_of_match(a, bt)
  end

  defp beginning_of_match(_, []) do
    false
  end

  defp is_sublist([[x | at], [x | bt]]) do
    is_sublist([at, bt])
  end

  defp is_sublist([[], _]) do
    true
  end

  defp is_sublist([_, _]) do
    false
  end
end
