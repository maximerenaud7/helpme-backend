# frozen_string_literal: true

class Exercise < ApplicationRecord
  has_many :exercise_answers, dependent: :destroy
  has_many :answers, through: :exercise_answers
  has_many :exercise_variables, dependent: :destroy
  has_many :variables, through: :exercise_variables
end
