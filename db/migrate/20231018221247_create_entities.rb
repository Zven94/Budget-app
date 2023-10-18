class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.float :amount
      t.reference :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
