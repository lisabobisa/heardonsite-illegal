class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.string :category
      t.references :member, null: false, foreign_key: true
      t.integer :time_frame, null: false
      t.integer :days
      t.integer :cap, null: false

      t.timestamps
    end
  end
end
