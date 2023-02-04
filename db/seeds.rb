# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

variables =
  10.times.map do |i|
    Variable.create(name: "Percentage #{i} (%)", variable_type: :interval, value: "#{i * 3},#{100 - (i * 3)}")
  end

answer = Answer.create!(name: 'Answer 1', value: "Il n'y a pas de réponse")
Exercise.create!(
  name: 'Exercice 1', value: '${v%1} + ${v%2} = ?', answers: [answer], variables: variables.slice(0, 2)
)
