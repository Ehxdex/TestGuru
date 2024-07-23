# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TestPassage.destroy_all
UserBadge.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
Badge.destroy_all
User.destroy_all

users = User.create!([
  { first_name: 'User1', last_name: 'User1', email: 'test1@test.com', password: 'iamaguru', password_confirmation: 'iamaguru' },
  { first_name: 'User2', last_name: 'User2', email: 'test2@test.com', password: 'iamaguruadmin', password_confirmation: 'iamaguruadmin',type: "Admin" }
])
users[0].confirm
users[1].confirm

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'JS' }
])

tests = Test.create!([
  { title: 'Ruby beginner', level: 1, category: categories[0], author: users[0] },
  { title: 'Ruby advanced', level: 3, category: categories[0], author: users[0] },
  { title: 'Ruby pro', level: 5, category: categories[0], author: users[0] },
  { title: 'JS beginner', level: 1, category: categories[1], author: users[0] },
  { title: 'JS advanced', level: 4, category: categories[1], author: users[0] },
  { title: 'JS pro', level: 15, category: categories[1], author: users[0] }
])

questions = Question.create!([
  { body: 'What are objects in Ruby?', test: tests[0] },
  { body: "What's difference between 'puts' 'print'?", test: tests[0] },
  { body: 'What is the difference between calling super and calling super()?', test: tests[1] },
  { body: 'What is React JS?', test: tests[2] },
  { body: 'Where you can use AWAIT operator?', test: tests[3] },
  { body: 'What type of image maps could be used with JavaScript?', test: tests[4] },
  { body: 'What java wrapper type is created when JavaScript object is sent to Java?', test: tests[5] }
])

Answer.create!([
  { body: 'Everything in Ruby is an object.', correct: true, question: questions[0] },
  { body: 'There are no objects in ruby.', correct: false, question: questions[0] },
  { body: 'Only class instances.', correct: false, question: questions[0] },
  { body: 'Only strings.', correct: false, question: questions[0] },

  { body: 'Same functions.', correct: false, question: questions[1] },
  { body: 'PUTS and PRINT same as P function', correct: false, question: questions[1] },
  { body: 'PUTS add a new line at the end, PRINT same line', correct: true, question: questions[1] },
  { body: 'PRINT add a new line at the end, PUTS same line', correct: false, question: questions[1] },

  { body: 'No difference', correct: false, question_id: questions[2].id },
  { body: 'SUPER() - no arguments, SUPER - send all arguments passed to the function to parent.', correct: true, question_id: questions[2].id },
  { body: 'SUPER - no arguments, SUPER() - send all arguments passed to the function to parent.', correct: false, question_id: questions[2].id },
  { body: 'SUPER and SUPER() no arguments', correct: false, question_id: questions[2].id },

  { body: 'Game framework', correct: false, question: questions[3] },
  { body: 'Backend library', correct: false, question: questions[3] },
  { body: 'Library for web and native user interfaces.', correct: true, question: questions[3] },
  { body: 'Machine learning framefork', correct: false, question: questions[3] },

  { body: 'An async function or at the top level of module.z', correct: true, question: questions[4] },
  { body: 'Just an async function', correct: false, question: questions[4] },
  { body: 'Just at the top level of module.z', correct: false, question: questions[4] },
  { body: 'Same as WARN()', correct: false, question: questions[4] },

  { body: 'Client-side image maps', correct: true, question: questions[5] },
  { body: 'Server-side image maps', correct: false, question: questions[5] },
  { body: 'Both A & B', correct: false, question: questions[5] },
  { body: 'Localhost image maps', correct: false, question: questions[5] },

  { body: 'ScriptObject', correct: false, question: questions[6] },
  { body: 'JavaObject', correct: false, question: questions[6] },
  { body: 'Jobject', correct: false, question: questions[6] },
  { body: 'JSObject', correct: true, question: questions[6] }
])

TestPassage.create!([
  { user: users[0], test: tests[0], current_question: questions[0] },
  { user: users[0], test: tests[1], current_question: questions[1] }
])

badge = Badge.create!([
  { title: "All backend tests", image_url: "https://www.flaticon.com/free-icon/badge_969088?term=badges&page=1&position=10&origin=tag&related_id=969088", role: "all_tests_from_backend", criteria: "Complete 5 tests" },
  { title: "First try", image_url: "https://www.flaticon.com/free-icon/badge_969052?term=badges&related_id=969052", role: "first_try", criteria: "Pass the test on the first try" },
  { title: "All tests by level", image_url: "https://www.flaticon.com/free-icon/badge_969016?term=badges&related_id=969016", role: "all_tests_by_level", criteria: "Complete all tests by the level" }
])
