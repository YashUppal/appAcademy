class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = Array.new # []
    @students = Array.new # []
    @grades = Hash.new { |hash,key| hash[key] = Array.new } # Design a hash, with default value as an empty array
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    else
      return false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  # Part 2

  def student_to_teacher_ratio
    begin
    (@students.length / @teachers.length).round
    rescue
      return "No teachers yet, hire some teachers :("
    end
    # @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student] << grade
      return true
    end
    return false
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if !@students.include?(student) || @grades[student].length == 0
      return nil
    else
      return @grades[student].sum / @grades[student].length
    end
  end
end
