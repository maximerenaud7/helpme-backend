class Variable < ApplicationRecord
  enum :variable_type, [ :text, :constant, :interval, :list ]
end
