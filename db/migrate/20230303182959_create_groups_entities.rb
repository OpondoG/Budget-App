class CreateGroupsEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_entities do |t|
      t.references :groups, null: false, foreign_key: true
      t.references :entities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
