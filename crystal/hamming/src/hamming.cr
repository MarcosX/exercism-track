class Hamming
  def self.compute(base_strand, to_compare_strand)
    raise ArgumentError.new if base_strand.size != to_compare_strand.size
    count_different_nucleotides(base_strand.chars, to_compare_strand.chars)
  end

  private def self.count_different_nucleotides(base_strand_chars, to_compare_strand_chars)
    different_nucleotides = 0
    base_strand_chars.each_with_index do |element, index|
      different_nucleotides += 1 if element != to_compare_strand_chars[index]
    end
    different_nucleotides
  end
end
