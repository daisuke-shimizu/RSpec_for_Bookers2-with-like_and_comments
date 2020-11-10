class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #以下追加。
  validates :book_id, presence: true, uniqueness: {scope: :user_id}

end
