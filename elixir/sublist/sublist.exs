defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b do
    :equal
  end

  def compare(a, [b_head | b_tail]) when a == [] do
   case compare(a, b_tail) do
     :equal -> :sublist
     _ -> :error
   end
  end
end
