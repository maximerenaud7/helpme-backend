# frozen_string_literal: true

class Answer < ApplicationRecord
  include Transformable

  has_many :occurences
end
