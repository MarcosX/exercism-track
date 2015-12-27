defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate_strand(strand)
    validate_nucleotide(nucleotide)
    Enum.filter(strand, &(&1 == nucleotide))
    |> Enum.count
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    validate_strand(strand)
    %{
      ?A => count(strand, ?A),
      ?T => count(strand, ?T),
      ?C => count(strand, ?C),
      ?G => count(strand, ?G),
    }
  end

  defp validate_strand(strand) do
    if (has_invalid_nucleotide?(strand)) do
      raise ArgumentError
    end
  end

  defp validate_nucleotide(nucleotide) do
    if (!valid_nucleotide?(nucleotide)) do
      raise ArgumentError
    end
  end

  defp has_invalid_nucleotide?(strand) do
    Enum.count(Enum.reject(strand, &(valid_nucleotide?(&1)))) > 0
  end

  defp valid_nucleotide?(nucleotide) do
    Enum.member?(@nucleotides, nucleotide)
  end
end
