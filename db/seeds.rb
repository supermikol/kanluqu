# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create Admin
admin = User.new(full_name: "Mike-Admin", email: "mdu123@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
admin.save!

#Create Simple User
user = User.new(full_name: "Mike-User", email: "gummibare@gmail.com", password: "123456", password_confirmation: "123456", admin: false)
user.save!


#Create Applications
Application.create([
  {user_id: 1, student_name: "Joey", major: "Biology", location: "Shanghai", zone: "Mainland China", gender: "M", year: 2016, study_abroad: false, note: "This applicant lived in Japan"},
  {user_id: 1, student_name: "Cindy", major: "Business", location: "Guangzhou", zone: "Mainland China", gender: "F", year: 2016, study_abroad: true},
  {user_id: 1, student_name: "Jenny", major: "Finance", location: "Guangzhou", zone: "Mainland China", gender: "F", year: 2016, study_abroad: false},
  {user_id: 1, student_name: "Cathy", major: "Mechanical Engineering", location: "Guangzhou", zone: "Mainland China", gender: "F", year: 2016, study_abroad: true},
  {user_id: 1, student_name: "Deanna", major: "CS", location: "Guangzhou", zone: "Mainland China", gender: "F", year: 2015, study_abroad: false},
  {user_id: 1, student_name: "Ryan", major: "Civil Engineering", location: "Guangzhou", zone: "Mainland China", gender: "M", year: 2015, study_abroad: true},
  {user_id: 1, student_name: "David", major: "CS", location: "San Francisco", zone: "USA", gender: "M", year: 2015, study_abroad: true}

  ])

#Create National Universities
School.create([
  {name: "UCLA", country: "USA", category: "US University"},
  {name: "USC", country: "USA", category: "US University"},
  {name: "Stanford", country: "USA", category: "US University"},
  {name: "Swarthmore", country: "USA", category: "Liberal Arts College"},
  {name: "Occidental", country: "USA", category: "Liberal Arts College"}
  ])

#Create LACs

#Create Rankings
Ranking.create([{school_id: 1, rank: 1, year: 2016},{school_id: 2, rank: 3, year: 2016},{school_id: 3, rank: 2, year: 2016}])

#Create Prompts
Prompt.create([
  {school_id: 1, content: "Tell us about yourself in 250 words or less", detail: "Make it funny!", year: 2016},
  {school_id: 2, content: "What matters to you?", detail: "Anything that matters!", year: 2016},
  {school_id: 1, content: "Where's Waldo?", year: 2016}
  ])

#Create Essays
Essay.create([
  {application_id: 1, prompt_id: 1, category: "Main Essay", title: "My life and I", content: "hello this is an essay. \nThis essay is about some cool stuff.\n Check it out", sentiment: 0.5},
  {application_id: 2, prompt_id: 3, category: "Supplement", title: "Waldo Lives", content: "hello this is an essay. \nThis essay is about some cool stuff.\n Check it out", sentiment: 0.4},
  {application_id: 2, prompt_id: 2, category: "Supplement", title: "This matters", content: "hello this is the what matters essay. \nThis essay is about some cool stuff.\n Check it out", sentiment: 0.8}
  ])

#Create Test Scores
TestScore.create([{application_id: 1, category: "AP", subject: "Calculus AB", score: 5, date: "05/15/2016"},
  {application_id: 1, category: "SAT", subject: "Math", score: 800, date: "05/01/2016"},
  {application_id: 1, category: "SAT", subject: "Writing", score: 730, date: "05/01/2016"},
  {application_id: 1, category: "SAT", subject: "Critical Reading", score: 730, date: "05/01/2016"},
  {application_id: 2, category: "SAT", subject: "Math", score: 780, date: "05/01/2016"},
  {application_id: 2, category: "SAT", subject: "Writing", score: 760, date: "05/01/2016"},
  {application_id: 2, category: "SAT", subject: "Critical Reading", score: 740, date: "05/01/2016"},
  {application_id: 3, category: "SAT", subject: "Math", score: 760, date: "05/01/2016"},
  {application_id: 3, category: "SAT", subject: "Writing", score: 710, date: "05/01/2016"},
  {application_id: 3, category: "SAT", subject: "Critical Reading", score: 640, date: "05/01/2016"},
  {application_id: 2, category: "AP", subject: "Physics", score: 5, date: "05/10/2016"}
  {application_id: 3, category: "AP", subject: "Biology", score: 4, date: "05/10/2016"}
  {application_id: 1, category: "AP", subject: "Computer Science", score: 4, date: "05/10/2016"}
  {application_id: 2, category: "AP", subject: "English Literature", score: 3, date: "05/10/2016"}
  ])

#Create Extracurriculars
Extracurricular.create([
  {application_id: 1, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", start_date: "05/01/2015", end_date: "05/30/2015"},
  {application_id: 1, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", start_date: "05/01/2015", end_date: "05/30/2015"},
  {application_id: 2, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", start_date: "05/01/2015", end_date: "05/30/2015"},
  {application_id: 2, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", start_date: "05/01/2015", end_date: "05/30/2015"},
  {application_id: 3, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", start_date: "05/01/2015", end_date: "05/30/2015"}
    ])


#Create Favorites
# Favorite.create(user_id: 1)

#Create Admits
Admit.create([{application_id: 1, school_id: 1, admitted: true},{application_id: 2, school_id: 1, admitted: true},{application_id: 2, school_id: 2, admitted: false}])
