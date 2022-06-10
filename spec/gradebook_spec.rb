require "./lib/gradebook"
require './lib/course'
require './lib/student'

RSpec.describe Gradebook do
  it "exists" do
    gradebook = Gradebook.new("Redd")

    expect(gradebook).to be_a Gradebook
    expect(gradebook.instructor).to eq ("Redd")
  end

  it "has a course catalog" do
    gradebook = Gradebook.new("Redd")
    course_1 = Course.new("Calculus", 2)
    course_2 = Course.new("Chemistry", 3)
    gradebook.add_course(course_1)
    gradebook.add_course(course_2)

    expect(gradebook.courses).to eq([course_1, course_2])
  end

  it "can all list students in each course" do
    gradebook = Gradebook.new("Redd")
    course_1 = Course.new("Calculus", 2)
    course_2 = Course.new("Chemistry", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Craig", age: 20})
    student4 = Student.new({name: "Avery", age: 26})
    gradebook.add_course(course_1)
    gradebook.add_course(course_2)
    course_1.enroll(student1)
    course_1.enroll(student2)
    course_2.enroll(student3)
    course_2.enroll(student4)

    expect(gradebook.students_enrolled).to eq([student1, student2, student3, student4])
  end

  it "can list students below a threshold" do
    gradebook = Gradebook.new("Redd")
    course_1 = Course.new("Calculus", 2)
    course_2 = Course.new("Chemistry", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Craig", age: 20})
    student4 = Student.new({name: "Avery", age: 26})
    gradebook.add_course(course_1)
    gradebook.add_course(course_2)
    course_1.enroll(student1)
    course_1.enroll(student2)
    course_2.enroll(student3)
    course_2.enroll(student4)
    student1.log_score(89)
    student2.log_score(78)
    student3.log_score(68)
    student4.log_score(55)

    expect(gradebook.grade_below_threshold).to eq([student3, student4])
  end
end
