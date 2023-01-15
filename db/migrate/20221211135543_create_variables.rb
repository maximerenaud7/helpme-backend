class CreateVariables < ActiveRecord::Migration[7.0]
  def change
    create_table :variables do |t|
      t.string :slug
      t.string :display_name
      t.text :value
      t.integer :variable_type, default: 0
      
      t.timestamps
    end
  end
end
