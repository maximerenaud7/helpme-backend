# frozen_string_literal: true

class Variable < ApplicationRecord
  enum variable_type: { text: 'text', constant: 'constant', interval: 'interval', list: 'list' }
end
