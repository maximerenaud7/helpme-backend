class CreateVariables < ActiveRecord::Migration[7.0]
  def change
    create_enum :variable_type, %w[text constant interval list]
    create_table :variables do |t|
      t.string :name
      t.text :value
      t.enum :variable_type, enum_type: :variable_type, default: 'text', null: false
      t.timestamps
    end
  end
end
