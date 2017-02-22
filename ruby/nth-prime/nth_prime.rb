class Prime
  @@primes = [1, 2]

  def self.nth(n)
    raise ArgumentError if n <= 0
    @@primes << find_next_prime while @@primes[n].nil? if @@primes[n].nil?
    @@primes[n]
  end

  private
  def self.is_prime?(number)
    (2..number-1).find do |previous_number|
      (number % previous_number) == 0
    end.nil?
  end

  def self.find_next_prime
    current_prime = @@primes.last + 1
    current_prime += 1 until is_prime?(current_prime)
    current_prime
  end
end
