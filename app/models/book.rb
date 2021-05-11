class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(key, search)
    case search
    when "完全一致"
      Book.where("title LIKE ? OR body LIKE ?", key, key)
    when "部分一致"
      Book.where("title LIKE ? OR body LIKE ?", "%#{key}%" , "%#{key}%")
    when "前方一致"
      Book.where("title LIKE ? OR body LIKE ?", "#{key}%" , "#{key}%")
    when "後方一致"
      Book.where("title LIKE ? OR body LIKE ?", "%#{key}" , "%#{key}")
    end
  end
end
