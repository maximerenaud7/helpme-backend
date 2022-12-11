class CreateExerciseAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_answers do |t|
      t.belongs_to :exercise
      t.belongs_to :answer
      t.integer :priority

      t.timestamps
    end
  end
end
