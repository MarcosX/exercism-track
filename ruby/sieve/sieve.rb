class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    primes = (2..@limit).to_a
    primes.each do |number, is_prime|
        multiplier = 2
        until number * multiplier > @limit do
          primes.delete(number*multiplier)
          multiplier += 1
        end
    end
    primes
  end
end
