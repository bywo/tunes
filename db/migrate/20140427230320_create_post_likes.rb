class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
