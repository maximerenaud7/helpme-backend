# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

A = Variable.create(slug: "taux-1", display_name: "Taux 1", variable_type: :interval, value: "10-20")
B = Variable.create(slug: "taux-2", display_name: "Taux 2", variable_type: :interval, value: "20-30")
C = Variable.create(slug: "result", display_name: "Résultat", variable_type: :formula, value: "text(taux-1) + text(taux-2)")

no_answer = Answer.create(display_name: "Aucune réponse", html: "Il n'y a pas de réponse")
answer = Answer.create(display_name: "Answer 1", html: "<span data-variable-id=\"#{C.id}\" data-occurence-id=\"4\"></span>")

exercise = Exercise.create(
  display_name: "Exercice 1",
  html: "Exemple : <span data-variable-id=\"#{C.id}\" data-occurence-id=\"0\"></span> = <span data-variable-id=\"#{C.id}\" data-occurence-id=\"1\"></span> = <span data-variable-id=\"#{C.id}\" data-occurence-id=\"2\"></span> = <span data-variable-id=\"#{C.id}\" data-occurence-id=\"3\"></span>",
  occurences: [
    Occurence.create({ id: 0, occurence_type: :text, variable: C }),
    Occurence.create({ id: 1, occurence_type: :raw_formula, variable: C }),
    Occurence.create({ id: 2, occurence_type: :formula, variable: C }),
    Occurence.create({ id: 3, occurence_type: :value, variable: C }),
  ],
  answers: [
    no_answer,
    answer
  ]
)