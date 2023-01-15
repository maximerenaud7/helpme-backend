class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :display_name
      t.text :html

      t.timestamps
    end
  end
end
