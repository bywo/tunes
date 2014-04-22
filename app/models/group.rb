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

  def add_text_post!(text_post)
    text_posts<<(text_post)
  end

  def add_song_post!(song_post)
    song_posts<<(song_post)
  end
end
