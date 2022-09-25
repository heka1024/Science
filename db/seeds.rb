# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.insert_all([
  {username: "admin", nickname: "관리자"},
  {username: "user", nickname: "사용자"},
  {username: "ruby", nickname: "rubymaster"},
  {username: "rails", nickname: "rails master"},
  {username: "javascript", nickname: "javascript master"},
  {username: "python", nickname: "python master"},
  {username: "java", nickname: "java master"},
])

Post.insert_all([
  {title: "ruby", content: "ruby is good", user_id: 3},
  {title: "rails", content: "rails is good", user_id: 4},
  {title: "javascript", content: "javascript is good", user_id: 5},
  {title: "python", content: "python is good", user_id: 6},
])

contents = 1_000.times.map do |i|
  {title: "title#{i}", content: "content#{i}", user_id: Random.rand(1..6)}
end
Post.insert_all(contents)