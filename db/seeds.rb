# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)
require "faker"

puts "Cleaning the database..."
puts "Cleaning answers..."
Answer.destroy_all
puts "Cleaning receivers..."
Receiver.destroy_all
puts "Cleaning survey_questions"
SurveyQuestion.destroy_all
puts "Cleaning Surveys..."
Survey.destroy_all
puts "Cleaning Template_questions..."
TemplateQuestion.destroy_all
puts "Cleaning Templates..."
Template.destroy_all
puts "Cleaning questions..."
Question.destroy_all

User.destroy_all

puts "Creating 6 templates..."
# if Template.count < 7
  template_resignation = Template.create!(
    name: "Resignation",
    description: "This survey aims to gather feedback from former employees who resigned, including the reasons for leaving, transition processes, and suggestions for improvement."
  )

  template_retirement = Template.create!(
    name: "Retirement",
    description: "This survey is designed to collect feedback from employees who retired, addressing their overall experience, fondest memories, future plans, and suggestions for passing on responsibilities."
  )

  template_termination = Template.create!(
    name: "Termination",
    description: "This survey focuses on gathering feedback from employees who were terminated, including their perspective on the circumstances, suggestions for improvement, and plans for addressing the termination when discussing it with future employers."
  )

  template_layoff = Template.create!(
    name: "Layoff",
    description: "This survey aims to collect feedback from employees who were laid off, addressing their initial reaction, provided assistance, job search plans, and potential interest in future opportunities with the company."
  )
# end

#template_end_contract = Template.create!(
 # name: "End of Contract",
  #description: "This survey is designed to gather feedback from employees whose contract has ended, including their overall experience, feedback on the work environment, training programs, and suggestions for improvement."
#)

#template_redundancy = Template.create!(
  #name: "Redundancy",
  #description: "This survey focuses on gathering feedback from employees affected by redundancy, addressing their experience during the process, support received, future career plans, and suggestions for the company."
#)

puts "Creating 20 questions..."
# Resignation questions
question_resignation1 = Question.create!(text: "What factors led to your decision to resign?")
question_resignation2 = Question.create!(text: "Have you secured a new employment opportunity, or is it a career transition?")
question_resignation3 = Question.create!(text: "Can you provide feedback on your experience working with the organization?")
question_resignation4 = Question.create!(text: "Is there anything the company could have done differently to retain you as an employee?")
question_resignation5 = Question.create!(text: "Do you regret your time with the company?")
question_resignation6 = Question.create!(text: "Do you feel nostalgic about your time with the company?")


# Retirement questions
question_retirement1 = Question.create!(text: "How long have you been with the organization, and what are your fondest memories from your career here?")
question_retirement2 = Question.create!(text: "What are your plans for retirement, both personally and professionally?")
question_retirement3 = Question.create!(text: "Are there any projects or responsibilities you would like to pass on to a successor?")
question_retirement4 = Question.create!(text: "Would you be interested in any part-time or consulting opportunities within the organization after retirement?")
question_retirement5 = Question.create!(text: "Do you regret your time with the company?")
question_retirement6 = Question.create!(text: "Do you feel nostalgic about your time with the company?")


# Termination questions
question_termination1 = Question.create!(text: "Can you please provide your perspective on the circumstances that led to your termination?")
question_termination2 = Question.create!(text: "Is there anything you feel was misunderstood or misrepresented in the termination decision?")
question_termination3 = Question.create!(text: "How do you plan to address this termination when discussing it with future employers?")
question_termination4 = Question.create!(text: "Do you have any suggestions on how the company can improve its termination processes or employee support systems?")
question_termination5 = Question.create!(text: "Do you regret your time with the company?")
question_termination6 = Question.create!(text: "Do you feel nostalgic about your time with the company?")


# Layoff questions
question_layoff1 = Question.create!(text: "How did you learn about the layoff decision, and what was your initial reaction?")
question_layoff2 = Question.create!(text: "Have you been provided with information regarding severance packages or assistance in finding new employment?")
question_layoff3 = Question.create!(text: "How do you plan to approach your job search and manage the impact of the layoff on your career?")
question_layoff4 = Question.create!(text: "Would you consider rejoining the company if opportunities become available in the future?")
question_layoff5 = Question.create!(text: "Do you regret your time with the company?")
question_layoff6 = Question.create!(text: "Do you feel nostalgic about your time with the company?")


puts "Creating template_questions..."
template_questions = [
  { template_id: template_resignation.id, question_id: question_resignation1.id },
  { template_id: template_resignation.id, question_id: question_resignation2.id },
  { template_id: template_resignation.id, question_id: question_resignation3.id },
  { template_id: template_resignation.id, question_id: question_resignation4.id },
  { template_id: template_resignation.id, question_id: question_resignation5.id },
  { template_id: template_resignation.id, question_id: question_resignation6.id },
  { template_id: template_retirement.id, question_id: question_retirement1.id },
  { template_id: template_retirement.id, question_id: question_retirement2.id },
  { template_id: template_retirement.id, question_id: question_retirement3.id },
  { template_id: template_retirement.id, question_id: question_retirement4.id },
  { template_id: template_retirement.id, question_id: question_retirement5.id },
  { template_id: template_retirement.id, question_id: question_retirement6.id },
  { template_id: template_termination.id, question_id: question_termination1.id },
  { template_id: template_termination.id, question_id: question_termination2.id },
  { template_id: template_termination.id, question_id: question_termination3.id },
  { template_id: template_termination.id, question_id: question_termination4.id },
  { template_id: template_termination.id, question_id: question_termination5.id },
  { template_id: template_termination.id, question_id: question_termination6.id },
  { template_id: template_layoff.id, question_id: question_layoff1.id },
  { template_id: template_layoff.id, question_id: question_layoff2.id },
  { template_id: template_layoff.id, question_id: question_layoff3.id },
  { template_id: template_layoff.id, question_id: question_layoff4.id },
  { template_id: template_layoff.id, question_id: question_layoff5.id },
  { template_id: template_layoff.id, question_id: question_layoff6.id },
]

template_questions.each do |template_question|
  TemplateQuestion.create!(template_question)
end


puts "Creating fake users if user list is less than 100..."

departure_types = ["resignation", "retirement", "termination", "layoff", "end of contract", "redundancy"]

# Méthode pour générer une date aléatoire entre deux bornes
def random_date(start_date, end_date)
  rand(start_date..end_date)
end

# Vérifie si un utilisateur avec l'adresse e-mail donnée existe déjà
def user_exists?(email)
  User.exists?(email: email)
end

# Vérifie si les dates sont valides (date d'intégration avant date de départ, dates dans le passé)
def valid_dates?(date_of_integration, date_of_departure)
  date_of_integration < date_of_departure && date_of_integration < Date.today && date_of_departure < Date.today
end

User.create!(first_name: "Benjamin", last_name: "cadars", email:"test@test.com", type_of_departure: "resignation", password:123456, date_of_integration: "2022-12-31", date_of_departure: "2023-02-19")

# Création de 100 utilisateurs
50.times do
  first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.unique.email

    # Vérifie si l'utilisateur existe déjà avec l'adresse e-mail générée
    next if user_exists?(email)

    type_of_departure = departure_types.sample
    date_of_integration = random_date(Date.new(2017, 1, 1), Date.new(2023, 6, 25))
    date_of_departure = random_date(date_of_integration, Date.new(2023, 6, 25))

    # Vérifie si les dates sont valides
    next unless valid_dates?(date_of_integration, date_of_departure)

    User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: 123456,
      type_of_departure: type_of_departure,
      date_of_integration: date_of_integration,
      date_of_departure: date_of_departure
    )
  end
puts "Creating Resignation Users..."
30.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.unique.email
  # Vérifie si l'utilisateur existe déjà avec l'adresse e-mail générée
  next if user_exists?(email)
  type_of_departure = departure_types.sample
  date_of_integration = random_date(Date.new(2017, 1, 1), Date.new(2023, 6, 25))
  date_of_departure = random_date(date_of_integration, Date.new(2023, 6, 25))
  # Vérifie si les dates sont valides
  next unless valid_dates?(date_of_integration, date_of_departure)
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: 123456,
    type_of_departure: "resignation",
    date_of_integration: date_of_integration,
    date_of_departure: date_of_departure
  )
end

puts "Creating Surveys..."

survey1 = Survey.create!(
  name: "Survey 1",
  description: "This is the first survey",
  anonymous: true,
  user_id: User.first.id,
  template_id: template_resignation.id,
  status: "draft"
)

survey2 = Survey.create!(
  name: "Survey 2",
  description: "This is the second survey",
  anonymous: false,
  user_id: User.all[1].id,
  template_id: template_termination.id,
  status: "active"
)

survey3 = Survey.create!(
  name: "Survey 3",
  description: "This is the third survey",
  anonymous: true,
  user_id: User.all[2].id,
  template_id: template_retirement.id,
  status: "completed"
)
template_resignation = Template.find_by(name: "Resignation")
template_termination = Template.find_by(name: "Termination")
template_layoff = Template.find_by(name: "Layoff")

# Création des 12 enquêtes
20.times do |i|
  status = "completed"

  case i % 3
  when 0
    name = "Survey #{i+1}"
    description = "This is the survey number #{i+1}."
    anonymous = true
    user_id = User.first.id
    template_id = template_resignation.id
  when 1
    name = "Survey #{i+1}"
    description = "This is the survey number #{i+1}."
    anonymous = false
    user_id = User.all[1].id
    template_id = template_termination.id
  when 2
    name = "Survey #{i+1}"
    description = "This is the survey number #{i+1}."
    anonymous = true
    user_id = User.all[2].id
    template_id = template_layoff.id
  end

  Survey.create!(
    name: name,
    description: description,
    anonymous: anonymous,
    user_id: user_id,
    template_id: template_id,
    status: status
  )
end

puts "Creating Receivers..."
survey_ids = (Survey.first.id..Survey.last.id).to_a
user_ids = (User.first.id..User.last.id).to_a

if Receiver.count < 51
  survey_ids.each do |survey_id|
    random_user_ids = user_ids.sample(rand(3..15))

    random_user_ids.each do |user_id|
      Receiver.create!(survey_id: survey_id, user_id: user_id)
    end
  end
end

puts "Creating answers..."
survey_ids = (Survey.first.id..Survey.last.id).to_a
receiver_ids = (Receiver.first.id..Receiver.last.id).to_a
question_ids = (Question.first.id..Question.last.id).to_a

if Answer.count < 100
100.times do
  random_survey_id = survey_ids.sample
  random_receiver_id = Survey.find(random_survey_id).receivers.pluck(:id).sample
  random_question_id = question_ids.sample

  text = "Answer text #{rand(1..100)}"
  Answer.create!(
    receiver_id: random_receiver_id,
    survey_id: random_survey_id,
    question_id: random_question_id,
    text: text,
  )
  end
end
