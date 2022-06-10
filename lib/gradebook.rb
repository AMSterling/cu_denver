class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def students_enrolled
    @courses.flat_map { |course| course.students }
  end

  def grade_below_threshold
   @courses.flat_map do |course|
     course.students.flat_map do |student|
      if student.grade < 70
        student
      end
    end
  end.compact
end
end
