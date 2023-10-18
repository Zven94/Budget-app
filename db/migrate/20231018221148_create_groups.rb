class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :icon
      t.reference :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
