class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image, destroy: false
  has_many :books, dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :name, presence: true, length: {maximum: 10, minimum: 2}
  validates :introduction, length: {maximum: 50}
  
  
   # フォローする側
  has_many :relationships, class_name: 'Relationship', foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followee, dependent: :destroy
  
  # フォローされる側
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships,  source: :follower, dependent: :destroy
  
  def following?(another_user)
    self.followings.include?(another_user)
  end

  def follow(another_user)
    unless self == another_user
      self.relationships.find_or_create_by(followee_id: another_user.id)
    end
  end
  
  def unfollow(another_user)
    unless self == another_user
      relationship = self.relationships.find_by(followee_id: another_user.id)
      relationship.destroy if relationship
    end
  end

end 