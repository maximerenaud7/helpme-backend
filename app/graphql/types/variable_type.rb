# frozen_string_literal: true

module Types
  class VariableType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :value, String
    field :variable_type, String
    field :slug, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
