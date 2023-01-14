# frozen_string_literal: true

class Answer < ApplicationRecord
  include Transformable

  after_initialize :after_initialize
end
