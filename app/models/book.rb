class Book < ApplicationRecord

	belongs_to :user

	validates :title, :body,presence:true,length:{maximum: 200},presence:{message:"error"}
    
    has_many :book_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    def self.search(search)
      return Book.all unless search
      Book.where(['content LIKE ?', "%#{search}%"])
    end
end
