class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :posts, inverse_of: :group
  has_many :text_posts, inverse_of: :group
  has_many :song_posts, inverse_of: :group

  validates :name, presence: true


  def add_member!(user)
    memberships.create!(user_id: user.id)
  end

  def remove_member!(user)
    memberships.find_by(user_id: user.id).destroy
  end

  def members
    users
  end

  def add_text_post!(user, content)
    text_posts.create!(user: user, content: content)
  end

  def add_song_post!(user, content, song)
    song_posts.create!(user: user, content: content, song: song)
  end

  def remove_post!(post)
    post.destroy
  end
end
