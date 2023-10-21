class AddEntityToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :entity, null: true, foreign_key: true
  end
end
