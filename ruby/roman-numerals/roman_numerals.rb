module BookKeeping
  VERSION = 2
end

class Integer
  ROMAN_TABLE = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'}

  def to_roman
    remainder = self
    roman_value = ''
    until remainder == 0
      next_number = find_next_number_to_reduce(remainder)
      remainder -= next_number
      roman_value += ROMAN_TABLE[next_number]
    end
    roman_value
  end

  private
  def find_next_number_to_reduce(remainder)
    ROMAN_TABLE.keys.find do |number|
      remainder >= number
    end
  end
end
