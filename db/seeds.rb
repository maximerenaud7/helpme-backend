# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

2.times do |i|
  Variable.create(name: "Interval #{i * 3}-#{100 - i * 3}", variable_type: :interval, value: "#{i * 3}-#{100 - i * 3}")
end

no_answer = Answer.create(name: "Aucune réponse", value: "Il n'y a pas de réponse")
exercise = Exercise.create(name: "Exercice 1", value: "${v%1} + ${v%2} = ?", answers: [
  no_answer,
  Answer.create(name: "Answer 2", value: "La réponse est <<${v%1}+${v%1}>>")
])
exercise2 = Exercise.create(name: "Exercice 2", value: "Quelle est la capitale de l'Europe ?", answers: [
  Answer.create(name: "Bruxelles", value: "Bruxelles"),
  Answer.create(name: "Berlin", value: "Berlin"),
  Answer.create(name: "Londres", value: "Londres"),
  Answer.create(name: "Paris", value: "Paris"),
])