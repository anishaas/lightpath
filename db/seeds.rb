# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  #ENV Variables not working  #ENV Variables not working
require 'learning_studio_authentication'
require 'learning_studio_core'
require 'JSON'
require 'figaro'
conf = LearningStudioAuthentication::Config::OAuthConfig.new({
  :application_id   => ENV['application_id'],
  :application_name => ENV['application_name'],
  :client_string    => ENV['client_string'],
  :consumer_key     => ENV['consumer_key'],
  :consumer_secret  =>  ENV['consumer_secret']
})
oauth_factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(conf)
service = LearningStudioCore::BasicService.new(oauth_factory)
service.use_oauth2('anisha.srivastava123.student@gmail.com','msuTooEg')
service.data_format = LearningStudioCore::BasicService::DataFormat::JSON
require 'learning_studio_authentication'
require 'learning_studio_core'
require 'JSON'
#Courses
@courses = service.request("GET","/me/courses?expand=course")
@course_title = JSON.parse(@courses.content)["courses"].first.first.last.first["course"]["displayCourseCode"]
#Lessons
@accounting_response = service.request("GET", "/me/courses/12288063/itemHierarchy?expand=item")
lessons = JSON.parse(@accounting_response.content)
accountinglessons = lessons["itemHierarchy"]
titles = accountinglessons['childItemNodes'].map do |child_node_item|
child_node_item['links'][0]['item']['title']
end
headers = accountinglessons['childItemNodes'].map do |child_node_item|
child_node_item['links'][0]['item']['header']
end
#Assignments

#Lightbulbs
@response_array = service.request("GET","/courses/12288063/webliographyEntries")
response = JSON.parse(@response_array.content)["webliographyEntries"]
response = response.sort_by{|response|response["title"]}
@lightbulbs = Array.new
response.each do |response|
    @lightbulbs.push(response["title"], response["description"], response["url"], response["submitter"]["firstName"])
  end

Student.create(first_name:"Mikaila", last_name:"Smith", email: "mikaila@example.com",
username:"mikailasmith", admin:false, password: 'password')
Student.create(first_name:"Arjun", last_name:"Srivastava", email: "arjun@example.com",
username:"arjunsrivastava", admin:false, password: 'password')
Student.create(first_name: "Floyd", last_name: "Pouncey", email: "floydp@example.com",
username:"floydpouncey", admin:false, password: 'password')

Teacher.create(first_name:"Grady", last_name:"Mohamed", email: "gradym@example.com",
username:"martinkevorkian", admin:true, password: 'password')
# Teacher.create(first_name:"Justin", last_name:"Herrick", email: "jh@example.com",
# username:"justinherrick", admin:true, password: 'password')
# Teacher.create(first_name:"Self", last_name:"-teaching", email: "anisha.srivastava123@gmail.com",
# username:"anishasrivastava", admin:true, password: 'password')

# Course.create(name:"World Literature",teacher_id:1, description:"Classic literature")
# Course.create(name:"Backend Engineering, Ruby on Rails", teacher_id:2, description:"Build web applications using Rails framework")
# Course.create(name:"Hindi: Grammar and Conversation", teacher_id:3, description: "Learn correct Hindi grammar and build vocabulary")
# Course.create(name:"Programming Interview Prep", teacher_id:3, description: "Practicing katas and programming logic")
# Course.create(name:"African American Literature",teacher_id:1, description:"Studying literature by African American authors, focusing on the Harlem Renaissance")
Course.create(name:@course_title, teacher_id: 1, description: "Introduction to Accounting")

Enrollment.create(student_id:1, course_id:1)
Enrollment.create(student_id:2, course_id:1)
Enrollment.create(student_id:3, course_id:1)
# Enrollment.create(student_id:2, course_id:1)
# Enrollment.create(student_id:3, course_id:2)
# Enrollment.create(student_id:3, course_id:1)
# Enrollment.create(student_id:1, course_id:3)
# Enrollment.create(student_id:1, course_id:5)

# Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 4, enrollment_id: 2, student_id: 2, summary:"A method is a function or feature of a class")
# Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 5, enrollment_id: 1, student_id: 1, summary: "Object oriented programming is about encapsulation and inheritance")
# Lightbulb.create(lesson_id: 2, course_id: 2, assignment_id: 1, enrollment_id: 5, student_id: 1, video_url:"www.youtube.com")
# Lightbulb.create(lesson_id: 4, course_id: 2, assignment_id: 1, enrollment_id: 2, student_id: 1, article_url:"railscasts.com/episodes/163-self-referential-association")
# Lightbulb.create(lesson_id: 1, course_id: 2, assignment_id: 4, enrollment_id: 4, student_id: 3, summary:"I view a method as an action carried out by a class.
# For example, if the class is Beyonce, the methods could be dance and sing.")
Lightbulb.create(lesson_id: 10, course_id: 1, enrollment_id: 1, student_id: 2, video_url: 'https://www.youtube.com/watch?v=rJyzD25Jo0w')
Lightbulb.create(lesson_id: 10, course_id: 1, enrollment_id: 1, student_id: 2, summary: 'I think of Accounts Receivables the same way I think about an IOU')
Lightbulb.create(lesson_id: 2, course_id: 1, enrollment_id: 1, student_id: 3, summary: 'Credits are the opposite in accounting - they are negative not positive!')

Assignment.create(lesson_id: 3, graded: false, course_id:1, title:"Moby Dick Reading Response", description: "Analyze Captain Ahab's inner conflit.")
Assignment.create(lesson_id: 3, graded: false, course_id:1, title:"The Fountainhead Essay", description: "Contrast Peter Keating and Howard Roark.")
Assignment.create(lesson_id: 2, graded: false, course_id:6, title: "Event Loop Blog Post", description: "In your own words explain the event loop and come up with a real world parallel.")
Assignment.create(lesson_id: 1, graded: false, course_id:6, title:"Quick Concept Check", description: "Answer the following question in a few sentences: What is a method?")
Assignment.create(lesson_id: 1, course_id:2, title:"Blog Post on Object Oriented Programming", description:"Write a blog post defining object oriented programming
and compare/contrast it to functional programming")
Assignment.create(lesson_id: 5, course_id:3, title:"Verb Conjugation Practice", description:"Record or write out conjugation for the following verbs")
Assignment.create(lesson_id: 6, graded: false, course_id:4, title:"Permutation Practice", description: "Writing methods to find all reorded combinations of characters in a string")
Assignment.create(lesson_id: 7, graded: false, course_id:5, title:"Gender Role Analysis", description: "Analyze the main character's limitations because of her gender")
Submission.create(assignment_id: 1, student_id: 1, body:'answer answer answer')

titles.each do |title|
  Lesson.create(course_id: 1, title: title)
end

Favorite.create(lightbulb_id: 3, student_id:2)
