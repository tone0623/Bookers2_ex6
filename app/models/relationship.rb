class Relationship < ApplicationRecord
  #フォローする側
  belongs_to :follower, class_name: "User"
  #フォローされる側
  belongs_to :followee, class_name: "User"

  validates :follower_id, presence: true
  validates :followee_id, presence: true
end
