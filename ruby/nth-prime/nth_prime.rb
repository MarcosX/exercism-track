module BookKeeping
  VERSION = 1
end

class Prime
  @@primes = [1, 2, 3]

  def self.nth(n)
    raise ArgumentError if n <= 0
    @@primes << find_next_prime while @@primes[n].nil? if @@primes[n].nil?
    @@primes[n]
  end

  private
  def self.is_prime?(number)
    return false if (number % 2 == 0) || (number % 3 == 0)
    previous_number = 5
    while (previous_number * previous_number) <= number
      return false if (number % previous_number == 0) || (number % (previous_number + 2) == 0)
      previous_number += 6
    end
    true
  end

  def self.find_next_prime
    current_prime = @@primes.last + 1
    current_prime += 1 until is_prime?(current_prime)
    current_prime
  end
end
