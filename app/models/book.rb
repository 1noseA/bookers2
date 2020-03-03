class Book < ApplicationRecord

	belongs_to :user

	validates :title, :body,presence:true,length:{maximum: 200},presence:{message:"error"}
    
    has_many :favorites, dependent: :destroy
    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
