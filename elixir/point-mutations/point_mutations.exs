defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand1) do
    0
  end

  def hamming_distance(strand1, strand2) do
    hamming_distance(strand1, strand2, 0)
  end

  defp hamming_distance([], [], acc) do
    acc
  end

  defp hamming_distance([], _, _acc) do
    nil
  end

  defp hamming_distance(_, [], _acc) do
    nil
  end

  defp hamming_distance([s1_head|s1_tail], [s1_head|s2_tail], acc) do
    hamming_distance(s1_tail, s2_tail, acc)
  end

  defp hamming_distance([_s1_head|s1_tail], [_s2_head|s2_tail], acc) do
    hamming_distance(s1_tail, s2_tail, acc+1)
  end
end
