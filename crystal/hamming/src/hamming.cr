class Hamming
  def self.compute(base_strand, to_compare_strand)
    raise ArgumentError.new if base_strand.size != to_compare_strand.size
    count_different_nucleotides(base_strand.chars, to_compare_strand.chars)
  end

  private def self.count_different_nucleotides(base_strand_chars, to_compare_strand_chars)
    base_strand_chars.zip(to_compare_strand_chars).select do |base_strand, to_compare_strand|
      base_strand != to_compare_strand
    end.size
  end
end
