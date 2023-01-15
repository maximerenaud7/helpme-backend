class CreateOccurences < ActiveRecord::Migration[7.0]
  def change
    create_table :occurences do |t|
      t.belongs_to :exercise
      t.belongs_to :answer
      t.belongs_to :variable

      t.integer :occurence_type, default: 0

      t.timestamps
    end
  end
end
