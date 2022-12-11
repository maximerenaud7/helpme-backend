class Exercise < ApplicationRecord
  has_many :exercise_answers
  has_many :answers, through: :exercise_answers
  # has_many :answers, through: :exercise_answers, source: :exercise
end
