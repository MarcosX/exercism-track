class School
  attr :students

  def initialize
    @students = {}
  end

  def add(name, grade)
    @students[grade] ||= []
    @students[grade] << name
    @students[grade].sort!
  end

  def students(grade)
    @students[grade] || []
  end

  def students_by_grade
    @students.sort.map do |grade, names|
      {
        grade: grade,
        students: names
      }
    end
  end
end
