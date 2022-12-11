# frozen_string_literal: true

class Variable < ApplicationRecord
  enum :variable_type, %i[text constant interval list]
end
