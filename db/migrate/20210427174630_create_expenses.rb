class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.boolean :approved
      t.references :budget, null: false, foreign_key: true
      t.integer :cost
      t.string :name

      t.timestamps
    end
  end
end
