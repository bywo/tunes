class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :post_likes, inverse_of: :post

  def likes
    post_likes
  end

  def add_like!(user)
    likes.create!(user: user)
  end

  def remove_like!(user)
    likes.find_by(user_id: user.id).destroy
  end
end
