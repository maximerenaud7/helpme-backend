class Occurence < ApplicationRecord
  belongs_to :exercise
  belongs_to :variable

  enum :occurence_type, %i[text raw_formula formula value]
end
