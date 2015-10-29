# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create(first_name:"Anisha", last_name:"Srivastava", email: "anisha@example.com",
username:"anishasrivastava", admin:false, password: 'password')

Teacher.create(first_name:"Martin", last_name:"Kevorkian", email: "mk@example.com",
username:"martinkevorkian", admin:true, password: 'password')
Teacher.create(first_name:"Justin", last_name:"Herrick", email: "jh@example.com",
username:"justinherrick", admin:true, password: 'password')

Course.create(name:"World Literature",teacher_id:1, description:"Classic literature")
Course.create(name:"Backend Engineering, Ruby on Rails", teacher_id:2, description:"Build web applications using Rails framework")

Enrollment.create(student_id:1, course_id:1)
Enrollment.create(student_id:1, course_id:2)

Lightbulb.create(course_id: 1, assignment_id: 1, enrollment_id: 1, student_id: 1, summary:"Ahab -- clash of fate and free-will")
Lightbulb.create(course_id: 1, assignment_id: 2, enrollment_id: 1, student_id: 1, summary:"Roark represents individualism, Keating conformity.")
Lightbulb.create(course_id: 2, assignment_id: 2, enrollment_id: 2, student_id: 1, summary:"A method is a function or feature of a class")
#teachers can also see which assignments brought the best 'lightbulb moments'

Assignment.create(course_id:1, title:"Moby Dick Reading Response", description: "Analyze Captain Ahab's inner conflit.")
Assignment.create(course_id:1, title:"The Fountainhead Essay", description: "Contrast Peter Keating and Howard Roark.")
Assignment.create(course_id:2, title: "Event Loop Blog Post", description: "In your own words explain the event loop and come up with a real world parallel.")
Assignment.create(course_id:2, title:"Quick Concept Check", description: "Answer the following question in a few sentences: What is a method?")
