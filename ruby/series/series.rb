class Series

  def initialize(serie)
    @serie = serie.split('')
  end

  def slices(amount)
    raise ArgumentError if amount > @serie.size
    @serie.each_with_index.map do |e, i|
      @serie[i..i+amount-1].join
    end.reject do |serie|
      serie.size != amount
    end
  end
end
