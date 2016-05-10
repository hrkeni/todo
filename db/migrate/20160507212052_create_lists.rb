class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :description, default: ""
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
