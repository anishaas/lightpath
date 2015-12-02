# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create(first_name:"Anisha", last_name:"Srivastava", email: "anisha@example.com",
username:"anishasrivastava", admin:false, password: 'password')
Student.create(first_name:"Mikaila", last_name:"Smith", email: "mikaila@example.com",
username:"mikailasmith", admin:false, password: 'password')
Student.create(first_name:"Arjun", last_name:"Srivastava", email: "arjun@example.com",
username:"arjunsrivastava", admin:false, password: 'password')

Teacher.create(first_name:"Martin", last_name:"Kevorkian", email: "mk@example.com",
username:"martinkevorkian", admin:true, password: 'password')
Teacher.create(first_name:"Justin", last_name:"Herrick", email: "jh@example.com",
username:"justinherrick", admin:true, password: 'password')
Teacher.create(first_name:"Self", last_name:"-teaching", email: "anisha.srivastava123@gmail.com",
username:"anishasrivastava", admin:true, password: 'password')

Course.create(name:"World Literature",teacher_id:1, description:"Classic literature")
Course.create(name:"Backend Engineering, Ruby on Rails", teacher_id:2, description:"Build web applications using Rails framework")
Course.create(name:"Hindi: Grammar and Conversation", teacher_id:3, description: "Learn correct Hindi grammar and build vocabulary")
Course.create(name:"Programming Interview Prep", teacher_id:3, description: "Practicing katas and programming logic")

Enrollment.create(student_id:1, course_id:1)
Enrollment.create(student_id:1, course_id:4)
Enrollment.create(student_id:1, course_id:2)
Enrollment.create(student_id:2, course_id:1)
Enrollment.create(student_id:3, course_id:2)
Enrollment.create(student_id:3, course_id:1)
Enrollment.create(student_id:1, course_id:3)

Lightbulb.create(lesson_id: 3, course_id: 1, assignment_id: 1, enrollment_id: 1, student_id: 1, summary:"Ahab -- clash of fate and free-will")
Lightbulb.create(lesson_id: 3, course_id: 1, assignment_id: 2, enrollment_id: 1, student_id: 1, summary:"Roark represents individualism, Keating conformity.")
Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 4, enrollment_id: 2, student_id: 1, summary:"A method is a function or feature of a class")
Lightbulb.create(lesson_id: 3, course_id: 1, assignment_id: 2, enrollment_id: 1, student_id: 2, summary:"Roark is ultimately more fulfilled.")
Lightbulb.create(lesson_id: 2, course_id: 2, assignment_id: 3, enrollment_id: 2, student_id: 2, summary:"Request and response")
Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 5, enrollment_id: 1, student_id: 1, summary: "Object oriented programming is about encapsulation and inheritance")
Lightbulb.create(lesson_id: 2, course_id: 2, assignment_id: 1, enrollment_id: 5, student_id: 3, video_url:"www.youtube.com")
Lightbulb.create(lesson_id: 4, course_id: 2, assignment_id: 1, enrollment_id: 2, student_id: 1, article_url:"railscasts.com/episodes/163-self-referential-association")
Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 4, enrollment_id: 4, student_id: 3, summary:"I view a method as an action carried out by a class.
For example, if the class is Beyonce, the methods could be dance and sing.")
Lightbulb.create(lesson_id: 5, course_id: 3, assignment_id: 1, enrollment_id: 7, student_id: 1, summary:"TEST TEST TEST")
Lightbulb.create(lesson_id: 5, course_id: 3, assignment_id: 1, enrollment_id: 7, student_id: 1, summary:"TESTTWO TESTTWO TESTTWO")


#teachers can also see which assignments brought the best 'lightbulb moments'

Assignment.create(lesson_id: 3, graded: false, course_id:1, title:"Moby Dick Reading Response", description: "Analyze Captain Ahab's inner conflit.")
Assignment.create(lesson_id: 3, graded: false, course_id:1, title:"The Fountainhead Essay", description: "Contrast Peter Keating and Howard Roark.")
Assignment.create(lesson_id: 2, graded: false, course_id:2, title: "Event Loop Blog Post", description: "In your own words explain the event loop and come up with a real world parallel.")
Assignment.create(lesson_id: 1, graded: false, course_id:2, title:"Quick Concept Check", description: "Answer the following question in a few sentences: What is a method?")
Assignment.create(lesson_id: 1, course_id:2, title:"Blog Post on Object Oriented Programming", description:"Write a blog post defining object oriented programming
and compare/contrast it to functional programming")
Assignment.create(lesson_id: 5, course_id:3, title:"Verb Conjugation Practice", description:"Record or write out conjugation for the following verbs")
Assignment.create(lesson_id: 6, graded: false, course_id:4, title:"Permutation Practice", description: "Writing methods to find all reorded combinations of characters in a string")


Submission.create(assignment_id: 1, student_id: 1, body:'answer answer answer')

Lesson.create(number: 1, course_id: 2, title:"Object Oriented Programming", description: "In OOP, everything is an object.
Object object object object object")
Lesson.create(number: 2, course_id: 2, title:"Interacting with Server", description: "Communicate with the server. Request response, request response")
Lesson.create(number: 1, course_id: 1, title:"Novels", description: "Studying the novel. Themes. Conformity. Individualism.")
Lesson.create(number: 10, course_id: 2, title:"Self-referential Tables", description: "A field in the table need to be associated with another field in the table that has the same content.
Ex) Friend following a friend on social media.")
Lesson.create(number: 1, course_id: 3, title:"Verb Conjugation", description: "Using verbs in sentences and conjugating based on tense and gender")
Lesson.create(number: 1, course_id: 4, title:"Permutations", description: "Finding all combinations of a string")
