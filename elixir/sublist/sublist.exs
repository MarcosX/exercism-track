defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a)  do
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
        if find_match(a, b), do: :sublist, else: :unequal
      length(a) > length(b) ->
        if find_match(b, a), do: :superlist, else: :unequal
    end
  end

  defp find_match([head|a_tail], [head|b_tail]) do
    if(is_sublist(a_tail, b_tail)) do
      true
    else
      find_match([head|a_tail], b_tail)
    end
  end

  defp find_match(a, [_b_head|b_tail]) do
    find_match(a, b_tail)
  end

  defp find_match(_a, []) do
    false
  end

  defp is_sublist([head|a_tail], [head|b_tail]) do
    is_sublist(a_tail, b_tail)
  end

  defp is_sublist([], _b) do
    true
  end

  defp is_sublist(_a, _b) do
    false
  end
end
