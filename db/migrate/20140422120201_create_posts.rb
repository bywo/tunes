class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :type
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.belongs_to :song, index: true

      t.timestamps
    end
  end
end
