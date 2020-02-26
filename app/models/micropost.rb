class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorites
  has_many :users, through: :favorites, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }
end
