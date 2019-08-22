class Matrix
  attr_reader :rows, :columns

  def initialize(rows)
    @rows = []
    @columns = []
    rows.split(/\n/).each do |row|
      @rows << row.split.map(&:to_i)
      row.split.each_with_index do |cell, index|
        @columns[index] ||= []
        @columns[index] << cell.to_i
      end
    end
  end
end
