# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Test.destroy_all
Question.destroy_all
User.destroy_all
Category.destroy_all
Answer.destroy_all

User.create!([
  { name: 'User1', email: 'test@test.com' },
  { name: 'User2', email: 'test1@test.com' },
  { name: 'User3', email: 'test2@test.com' },
])

Category.create!([
  { title: 'Ruby' },
  { title: 'JS' },
  { title: 'Swift' },
  { title: 'C++' },
  { title: 'Assembler' }
])

Test.create!([
  { title: 'Frontend', level: 1, category_id: 2, author_id: 1 },
  { title: 'Backend', level: 2, category_id: 1, author_id: 1 },
  { title: 'Mobile Development', level: 3, category_id: 3, author_id: 2 },
  { title: 'Machine Learning', level: 4, category_id: 4, author_id: 2 },
  { title: 'Low-level Development', level: 5, category_id: 5, author_id: 3 }
])

Question.create!([
  { body: 'What is React JS?', test_id: 1 },
  { body: 'What is the difference between calling super and calling super()?', test_id: 2 },
  { body: 'How would you compare two tuples to ensure their values are identical?', test_id: 3 },
  { body: 'How does CloudKit differ from Core Data?', test_id: 3 },
  { body: 'What are objects in Ruby?', test_id: 2 }
])

Answer.create!([
  { body: 'React is the library for web and native user interfaces. Build user interfaces out of individual pieces called components written in JavaScript.', correct: true, question_id: 1 },
  { body: 'Everything in Ruby is an object.', correct: true, question_id: 5 }
])
