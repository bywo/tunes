class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates_uniqueness_of :user, scope: :group
end
