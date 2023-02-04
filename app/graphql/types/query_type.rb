# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :exercises,
          [Types::ExerciseType],
          null: false,
          description: 'Return a list of exercise'
    field :variables,
          [Types::VariableType],
          null: false,
          description: 'Return a list of variables'

    def variables
      Variable.all
    end

    def exercises
      Exercise.includes(:variables)
    end
  end
end
