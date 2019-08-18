class ResistorColorDuo

  @@color_code = [ "black",
                   "brown",
                   "red",
                   "orange",
                   "yellow",
                   "green",
                   "blue",
                   "violet",
                   "grey",
                   "white"]

  def self.value(colors)
    value_of(colors[0]) * 10 + value_of(colors[1]) unless colors.size < 2
  end

  private
  def self.value_of(color)
    @@color_code.index(color)
  end
end
