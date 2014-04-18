class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

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
end
