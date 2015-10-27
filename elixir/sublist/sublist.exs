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
    sublist = a -- b
    superlist = b -- a
    cond do
      List.first(sublist) == nil -> :sublist
      List.first(superlist) == nil -> :superlist
      true -> :unequal
    end
  end
end
