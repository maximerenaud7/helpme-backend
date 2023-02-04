# frozen_string_literal: true

module Types
  class ExerciseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :value, String
    field :variables, [VariableType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
