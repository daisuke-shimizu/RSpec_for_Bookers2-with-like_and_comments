class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #以下追加。
  validates :user_id, presence: true, uniqueness: {scope: :book_id}
  validates :book_id, presence: true
  
end
