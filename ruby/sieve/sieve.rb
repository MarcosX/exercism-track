class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    primes = (2..@limit).to_a
    primes.each do |number|
      multipliers(number).each do |multiplier|
        primes.delete(number*multiplier)
      end
    end
  end

  private
  def multipliers(number)
    2..@limit/number
  end
end
