class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :title
      t.string :description
      t.belongs_to :list, index: true, foreign_key: true
      t.integer :state, default: 0

      t.timestamps null: false
    end
  end
end
