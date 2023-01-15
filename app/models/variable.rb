# frozen_string_literal: true

class Variable < ApplicationRecord
  has_many :occurences

  enum :variable_type, %i[text constant interval formula list]
end
