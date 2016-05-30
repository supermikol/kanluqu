# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

us_universities = [["Princeton", 1], ["Harvard", 2], ["Yale", 3], ["Columbia", 4], ["University of Chicago", 4], ["Stanford", 4], ["MIT", 7], ["Duke", 8], ["Cal Tech", 10], ["University of Pennsylvania", 9], ["Johns Hopkins", 10] ,["Northwestern", 12], ["Dartmouth", 12], ["Washington University in St. Louis", 15], ["Cornell", 15], ["Brown", 14], ["Notre Dame", 18], ["Vanderbilt", 15], ["Rice", 18], ["UC Berkeley", 20], ["Emory", 21], ["Georgetown", 21], ["UCLA", 23], ["University of Virginia", 26], ["Carnegie Mellon", 23], ["University of Southern California", 23], ["Wake Forest", 27], ["Tufts", 27], ["University of Michigan - Ann Arbor", 29], ["University of North Carolina", 30], ["Boston College", 30], ["New York University", 32], ["College of William and Mary", 34], ["Rochester", 33], ["Brandeis", 34], ["Georgia Tech", 36]]

lacs = [["Williams", 1], ["Amherst", 2], ["Swarthmore", 3], ["Pomona", 4], ["Middlebury", 4], ["Wellesley", 4], ["Bowdoin", 4], ["Carleton", 8], ["Davidson", 9], ["Haverford", 12], ["Vassar", 12], ["Claremont McKenna", 9], ["Colby", 19], ["Hamilton", 14], ["Harvey Mudd", 14], ["Wesleyan", 14], ["Grinnell", 19], ["Smith", 14], ["Washington and Lee", 14], ["Bates", 25], ["Macalester", 23], ["Colgate", 19], ["Oberlin", 23], ["Bryn Mawr", 25], ["Colorado", 25], ["University of Richmond", 32], ["Bucknell", 32]]

#Create Admin
admin = User.new(full_name: "Mike-Admin", email: "mdu123@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
admin.save!
admin2 = User.new(full_name: "Kevin Admin", email: "kvnl21@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
admin2.save!

#Create Simple User
user = User.new(full_name: "Mike-User", email: "user@test.com", password: "123456", password_confirmation: "123456", admin: false)
user.save!


#Create Applications
Application.create([
  {user_id: 1, student_name: "Joey", major: "Biology", location: "Shanghai", zone: "Mainland China", gender: "Male", year: 2016, study_abroad: false, note: "This applicant lived in Japan"},
  {user_id: 1, student_name: "Cindy", major: "Business", location: "Guangzhou", zone: "Mainland China", gender: "Female", year: 2016, study_abroad: true, note: "Member of National Olympiad Team in Chemistry"},
  {user_id: 1, student_name: "Jenny", major: "Finance", location: "Guangzhou", zone: "Mainland China", gender: "Female", year: 2016, study_abroad: false, note: "Low income family"},
  {user_id: 1, student_name: "Cathy", major: "Mechanical Engineering", location: "Guangzhou", zone: "Mainland China", gender: "Female", year: 2016, study_abroad: true},
  {user_id: 1, student_name: "Deanna", major: "CS", location: "Guangzhou", zone: "Mainland China", gender: "Female", year: 2015, study_abroad: false},
  {user_id: 1, student_name: "Ryan", major: "Civil Engineering", location: "Guangzhou", zone: "Mainland China", gender: "Male", year: 2015, study_abroad: true},
  {user_id: 1, student_name: "David", major: "CS", location: "San Francisco", zone: "USA", gender: "Male", year: 2015, study_abroad: true}

  ])

#Create National Universities
us_universities.each do |univ|
  school = School.create(name: univ[0], country: "USA", category: "National University")
  school.rankings << Ranking.create(rank:univ[1], year: 2016)
end


#Create LACs
lacs.each do |lac|
  school = School.create(name: lac[0], country: "USA", category: "Liberal Arts College")
  school.rankings << Ranking.create(rank:lac[1], year: 2016)
end

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
TestScore.create([
  {application_id: 1, category: "AP", subject: "Calculus AB", score: 5},
  {application_id: 1, category: "SAT", subject: "Math", score: 800},
  {application_id: 1, category: "SAT", subject: "Writing", score: 730},
  {application_id: 1, category: "SAT", subject: "Critical Reading", score: 730},
  {application_id: 2, category: "SAT", subject: "Math", score: 780},
  {application_id: 2, category: "SAT", subject: "Writing", score: 760},
  {application_id: 2, category: "SAT", subject: "Critical Reading", score: 740},
  {application_id: 3, category: "SAT", subject: "Math", score: 760},
  {application_id: 3, category: "SAT", subject: "Writing", score: 710},
  {application_id: 3, category: "SAT", subject: "Critical Reading", score: 640},
  {application_id: 2, category: "AP", subject: "Physics", score: 5},
  {application_id: 3, category: "AP", subject: "Biology", score: 4},
  {application_id: 1, category: "AP", subject: "Computer Science", score: 4},
  {application_id: 2, category: "AP", subject: "English Literature", score: 3}
  ])

#Create Extracurriculars
Extracurricular.create([
  {application_id: 1, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", duration: 15},
  {application_id: 1, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", duration: 25},
  {application_id: 2, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", duration: 35},
  {application_id: 2, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", duration: 10},
  {application_id: 3, name: "Global Leadership Program", category: "Summer Camp", position: "Participant", description: "This was a pretty good summer camp. I really liked the polar bears that slept ouside my tent.", duration: 5}
    ])


#Create Favorites
# Favorite.create(user_id: 1)

#Create Admits
Admit.create([{application_id: 1, school_id: 1, admitted: true},{application_id: 2, school_id: 1, admitted: true},{application_id: 2, school_id: 2, admitted: false}])
