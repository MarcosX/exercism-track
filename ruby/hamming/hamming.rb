class Hamming
  VERSION = 1
  def self.compute(a_dna, b_dna)
    raise ArgumentError unless a_dna.size == b_dna.size

    calculate_total_difference(a_dna.chars, b_dna.chars)
  end

  def self.calculate_total_difference(splitted_a_dna, splitted_b_dna)
    splitted_a_dna.zip(splitted_b_dna).count { |a, b| a != b }
  end
end
