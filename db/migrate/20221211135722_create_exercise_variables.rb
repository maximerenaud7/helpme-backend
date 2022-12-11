class CreateExerciseVariables < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_variables do |t|
      t.belongs_to :exercise
      t.belongs_to :variable

      t.timestamps
    end
  end
end
