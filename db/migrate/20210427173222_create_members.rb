class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :family, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :role, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
