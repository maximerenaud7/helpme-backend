# frozen_string_literal: true

class ExerciseAnswer < ApplicationRecord
  belongs_to :exercise
  belongs_to :answer
end
