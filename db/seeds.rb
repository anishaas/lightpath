# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@api_response =  HTTParty.get('https://api.learningstudio.com/me',
:headers => { "X-Authorization" => "Access_Token access_token=c5b8742f-c459-4fc2-91a1-7ee542acb214|da3e64c4-05d1-44d6-bcf7-cac945f2fd6d|38619307|2015-12-23T17%3a14%3a11|f3da636ea2b6fe9e4ad91de114660dc6" })
@classmates = HTTParty.get('https://api.learningstudio.com/users/38619307/classmates',
:headers => { "X-Authorization" => "Access_Token access_token=c5b8742f-c459-4fc2-91a1-7ee542acb214|da3e64c4-05d1-44d6-bcf7-cac945f2fd6d|38619307|2015-12-23T17%3a14%3a11|f3da636ea2b6fe9e4ad91de114660dc6" })
conf = LearningStudioAuthentication::Config::OAuthConfig.new({
    :application_id   => 'c5b8742f-c459-4fc2-91a1-7ee542acb214',
    :application_name => 'Lightpath',
    :client_string    => 'gbtestc',
    :consumer_key     => '4d2b474e-7b70-4b7e-aff5-7313567c2c38',
    :consumer_secret  =>  'DmyLEZn8ts7MuOUm'
})
oauth_factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(conf)
service = LearningStudioCore::BasicService.new(oauth_factory)
service.use_oauth2('anisha.srivastava123.student@gmail.com','msuTooEg')
service.data_format = LearningStudioCore::BasicService::DataFormat::JSON
@courses = service.request("GET","/me/courses?expand=course")
@course_title = JSON.parse(@courses.content)["courses"].first.first.last.first["course"]["displayCourseCode"]
# @assignments = service.request("GET", "/users/38619307/courses/12288063/itemHierarchy?expand=item")
# @assignments = JSON.parse(@assignments.content)["itemHierarchy"]["childItemNodes"]
# @assignments.sort_by {|assignment| assignment["childItemNodes"]}
# @assignment_headers = Array.new
# @assignment_titles = Array.new
# @assignments.each do |assignment|
#     @assignment_titles.push(assignment["title"])
#   end

Student.create(first_name:"Anisha", last_name:"Srivastava", email: "anisha@example.com",
username:"anishasrivastava", admin:false, password: 'password')
Student.create(first_name:"Mikaila", last_name:"Smith", email: "mikaila@example.com",
username:"mikailasmith", admin:false, password: 'password')
Student.create(first_name:"Arjun", last_name:"Srivastava", email: "arjun@example.com",
username:"arjunsrivastava", admin:false, password: 'password')
Student.create(first_name:"Test", last_name:"Test", email: "test@example.com",
username:"test", admin:false, password: 'password')
Student.create(first_name: "Floyd", last_name: "Pouncey", email: "testtest@example.com",
username:"floydpouncey", admin:false, password: 'password')
# Student.create(first_name:@classmates.first[1].first["firstName"], last_name:@classmates.first[1].first["lastName"],email: "grady@example.com",
# username:"gradymohamed", admin:false, password: 'password')


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
Course.create(name:"African American Literature",teacher_id:1, description:"Studying literature by African American authors, focusing on the Harlem Renaissance")
Course.create(name:@course_title, teacher_id: 1, description: "Introduction to Accounting")

Enrollment.create(student_id:1, course_id:1)
Enrollment.create(student_id:1, course_id:4)
Enrollment.create(student_id:1, course_id:2)
Enrollment.create(student_id:2, course_id:1)
Enrollment.create(student_id:3, course_id:2)
Enrollment.create(student_id:3, course_id:1)
Enrollment.create(student_id:1, course_id:3)
Enrollment.create(student_id:1, course_id:5)

Lightbulb.create(lesson_id: 3, course_id: 1, assignment_id: 1, enrollment_id: 1, student_id: 1, summary:"Ahab -- clash of fate and free-will")
Lightbulb.create(lesson_id: 3, course_id: 1, assignment_id: 2, enrollment_id: 1, student_id: 1, summary:"Roark represents individualism, Keating conformity.")
Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 4, enrollment_id: 2, student_id: 2, summary:"A method is a function or feature of a class")
Lightbulb.create(lesson_id: 3, course_id: 1, assignment_id: 2, enrollment_id: 1, student_id: 2, summary:"Roark is ultimately more fulfilled.")
Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 5, enrollment_id: 1, student_id: 1, summary: "Object oriented programming is about encapsulation and inheritance")
Lightbulb.create(lesson_id: 2, course_id: 2, assignment_id: 1, enrollment_id: 5, student_id: 1, video_url:"www.youtube.com")
Lightbulb.create(lesson_id: 4, course_id: 2, assignment_id: 1, enrollment_id: 2, student_id: 1, article_url:"railscasts.com/episodes/163-self-referential-association")
Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 4, enrollment_id: 4, student_id: 3, summary:"I view a method as an action carried out by a class.
For example, if the class is Beyonce, the methods could be dance and sing.")
Lightbulb.create(lesson_id: 7, course_id: 5, assignment_id: 8, enrollment_id: 8, student_id: 1, summary:"Gender discrimination transcends all races")


#teachers can also see which assignments brought the best 'lightbulb moments'

Assignment.create(lesson_id: 3, graded: false, course_id:1, title:"Moby Dick Reading Response", description: "Analyze Captain Ahab's inner conflit.")
Assignment.create(lesson_id: 3, graded: false, course_id:1, title:"The Fountainhead Essay", description: "Contrast Peter Keating and Howard Roark.")
Assignment.create(lesson_id: 2, graded: false, course_id:2, title: "Event Loop Blog Post", description: "In your own words explain the event loop and come up with a real world parallel.")
Assignment.create(lesson_id: 1, graded: false, course_id:2, title:"Quick Concept Check", description: "Answer the following question in a few sentences: What is a method?")
Assignment.create(lesson_id: 1, course_id:2, title:"Blog Post on Object Oriented Programming", description:"Write a blog post defining object oriented programming
and compare/contrast it to functional programming")
Assignment.create(lesson_id: 5, course_id:3, title:"Verb Conjugation Practice", description:"Record or write out conjugation for the following verbs")
Assignment.create(lesson_id: 6, graded: false, course_id:4, title:"Permutation Practice", description: "Writing methods to find all reorded combinations of characters in a string")
Assignment.create(lesson_id: 7, graded: false, course_id:5, title:"Gender Role Analysis", description: "Analyze the main character's limitations because of her gender")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[0], description: "TEST")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[1], description: "TEST")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[2], description: "TEST")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[3], description: "TEST")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[4], description: "TEST")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[5], description: "TEST")
# Assignment.create(lesson_id: 5, graded: false, course_id: 1, title: @assignment_titles[6], description: "TEST")

Submission.create(assignment_id: 1, student_id: 1, body:'answer answer answer')

Lesson.create(number: 1, course_id: 2, title:"Object Oriented Programming", description: "In OOP, everything is an object.
Object object object object object")
Lesson.create(number: 2, course_id: 2, title:"Interacting with Server", description: "Communicate with the server. Request response, request response")
Lesson.create(number: 1, course_id: 1, title:"Novels", description: "Studying the novel. Themes. Conformity. Individualism.")
Lesson.create(number: 10, course_id: 2, title:"Self-referential Tables", description: "A field in the table need to be associated with another field in the table that has the same content.
Ex) Friend following a friend on social media.")
Lesson.create(number: 1, course_id: 3, title:"Verb Conjugation", description: "Using verbs in sentences and conjugating based on tense and gender")
Lesson.create(number: 1, course_id: 4, title:"Permutations", description: "Finding all combinations of a string")
Lesson.create(number: 1, course_id: 5, title:"A Mercy, Toni Morrsion", description: "Gender roles in the novel")


Favorite.create(lightbulb_id: 1, student_id:2)
