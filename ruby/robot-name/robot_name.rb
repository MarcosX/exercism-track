class Robot
  attr_reader :name
  @@used_names = []

  def initialize
    reset
  end

  def reset
    @name = generate_random_name
    swap_letters_in_name if @@used_names.include?(@name)
    @@used_names << @name
  end

  private
  def generate_random_name
    (('A'..'Z').to_a.shuffle.take(2) +
     ('0'..'9').to_a.shuffle.take(3)).join
  end

  def swap_letters_in_name
    @name[0], @name[1] = @name[1], @name[0]
  end
end
