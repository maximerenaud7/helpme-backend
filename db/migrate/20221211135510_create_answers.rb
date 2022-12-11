class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.text :value

      t.timestamps
    end
  end
end
