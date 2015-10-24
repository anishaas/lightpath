# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create(first_name:"Anisha", last_name:"Srivastava", email: "anisha@example.com", password:"password",
username:"anishasrivastava")

Teacher.create(first_name:"Martin", last_name:"Kevorkian", email: "mk@example.com", password:"password",
username:"martinkevorkian")

Course.create(name:"World Literature",teacher_id:1, description:"Classic literature")

Enrollment.create(student_id:1, course_id:1)

Lightbulb.create(enrollment_id: 1, student_id: 1, summary:"Moby Dick, clash of fate and free-will")
