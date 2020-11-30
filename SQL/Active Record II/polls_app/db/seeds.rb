# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([ 
  {username: "roger"},
  {username: "john"},
  {username: "bob"}
])

Poll.create!([ 
  {title: "Roger's Poll", author_id: 1},
  {title: "John's Poll", author_id: 2}
 ])

questions = Question.create([ 
  {question: "What's the best programming language?", poll_id: 1},
  {question: "Best horror movie?", poll_id: 2}
])

answer_choices = AnswerChoice.create([
  {answer_choice: "Ruby",question_id: 1},
  {answer_choice: "Ofcourse Ruby", question_id: 1},
  {answer_choice: "Friday the 13th", question_id: 2},
  {answer_choice: "Halloween", question_id: 2}
])

responses = Response.create([
  {user_id: 1, question_id: 1, answer_choice_id: 2},
  {user_id: 1, question_id: 2, answer_choice_id: 3},
  {user_id: 2, question_id: 1, answer_choice_id: 2},
  {user_id: 3, question_id: 2, answer_choice_id: 4},
  {user_id: 3, question_id: 1, answer_choice_id: 1},
])
