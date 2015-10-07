class Hamming
  VERSION = 2
  DIFFERENT_SIZE_ERROR_MESSAGE = "dna sequences should have same size in order to be compared"

  def self.compute(base_dna_sequence, comparable_dna_sequence)
    find_different_pairs_in(base_dna_sequence.chars, comparable_dna_sequence.chars).size
  end

  private
  def self.find_different_pairs_in(base_dna_sequence, comparable_dna_sequence)
    raise ArgumentError.new(DIFFERENT_SIZE_ERROR_MESSAGE) unless base_dna_sequence.size == comparable_dna_sequence.size
    base_dna_sequence.zip(comparable_dna_sequence).select { |base_nucleotide, comparable_nucleotide| base_nucleotide != comparable_nucleotide }
  end
end
