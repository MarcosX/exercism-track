class Raindrops
  RAINDROP_PRIMES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(number)
    raindrops = prime_factors_for(number).uniq.map do |prime|
      RAINDROP_PRIMES[prime]
    end.join

    raindrops.empty? ? number.to_s : raindrops
  end

  private
  def self.prime_factors_for(number, prime_factors = [])
    first_prime_factor = RAINDROP_PRIMES.keys.find do |prime|
      number%prime == 0
    end

    unless first_prime_factor.nil?
      prime_factors << first_prime_factor
      prime_factors_for(number/first_prime_factor, prime_factors)
    end

    prime_factors
  end
end
