class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :name
      t.string :type
      t.belongs_to :user, index: true, foreign_key: true
      t.string :link
      t.string :image

      t.timestamps null: false
    end
  end
end
