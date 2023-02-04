# frozen_string_literal: true

class ExerciseVariable < ApplicationRecord
  belongs_to :exercise
  belongs_to :variable
end
