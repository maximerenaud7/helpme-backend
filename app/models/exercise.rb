# frozen_string_literal: true

class Exercise < ApplicationRecord
  include Transformable

  has_many :exercise_answers, dependent: :destroy
  has_many :answers, through: :exercise_answers
  has_many :occurences, dependent: :destroy
  # has_many :answers, through: :exercise_answers, source: :exercise

  def build
    answers.map(&:build)
    super
  end
end
