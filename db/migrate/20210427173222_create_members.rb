class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :family, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :role, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
