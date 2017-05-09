module BookKeeping
    VERSION = 3
end

class Pangram
  TOTAL_AMOUNT_OF_LETTERS = 26
  def self.pangram?(phrase)
    count_unique_letters(phrase) == TOTAL_AMOUNT_OF_LETTERS
  end

  private
  def self.count_unique_letters(phrase)
    phrase.downcase.split('').select {|char| char =~ /[a-z]/}.uniq.size
  end
end
