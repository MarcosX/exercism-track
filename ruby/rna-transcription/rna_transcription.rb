class Complement
  VERSION = 1

  DNA_CONVERT_TABLE = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
  }

  RNA_CONVERT_TABLE = {
    'G': 'C',
    'C': 'G',
    'U': 'A',
    'A': 'T'
  }

  def self.of_dna(dna)
    map_nucleotides(dna.chars, DNA_CONVERT_TABLE)
  end

  def self.of_rna(dna)
    map_nucleotides(dna.chars, RNA_CONVERT_TABLE)
  end

  def self.map_nucleotides(nucleotides, lookup_table)
    nucleotides.map do |nucleotide|
      nucleotide_lookup(nucleotide, lookup_table)
    end.join
  end

  def self.nucleotide_lookup(nucleotide, lookup_table)
      raise ArgumentError unless lookup_table.keys.include?(nucleotide.to_sym)
      lookup_table[nucleotide.to_sym]
  end
end
