defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([_head|l_tail]) do
    1+count(l_tail)
  end

  def count([]) do
    0
  end

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end

  defp do_reverse([], reverted) do
    reverted
  end

  defp do_reverse([l_head|l_tail], reverted) do
    do_reverse(l_tail,[l_head|reverted])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _f) do
    []
  end

  @spec map(list, (any -> any)) :: list
  def map([l_head|l_tail], f) do
    [f.(l_head)|map(l_tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f) do
    []
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([l_head|l_tail], f) do
    if f.(l_head) do
      [l_head|filter(l_tail, f)]
    else
      filter(l_tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f) do
    acc
  end

  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([l_head|l_tail], acc, f) do
    reduce(l_tail, f.(l_head, acc), f)
  end

  def append(a, []) do
    a
  end

  def append([], b) do
    b
  end

  @spec append(list, list) :: list
  def append([a_head|a_tail], b) do
    [a_head|append(a_tail, b)]
  end

  def concat([]) do
    []
  end

  @spec concat([[any]]) :: [any]
  def concat([ll_head|ll_tail]) do
    append(ll_head, concat(ll_tail))
  end
end
