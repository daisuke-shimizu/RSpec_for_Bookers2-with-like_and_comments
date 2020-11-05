require 'rails_helper'
RSpec.describe 'Favoriteモデルのテスト', type: :model do
    describe 'バリデーションのテスト' do
      let(:user) { create(:user) }
      let(:book) { build(:book, user_id: user.id) }
      # let!とすると、毎回データを作成してくれる
      let!(:favorite) { build(:favorite, book_id: book.id, user_id: user.id) }
    end

    describe 'アソシエーションのテスト' do
      context 'Userモデルとの関係' do
        it 'N:1となっている' do
          expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
      context 'Bookモデルとの関係' do
          it 'N:1となっている' do
            expect(Favorite.reflect_on_association(:book).macro).to eq :belongs_to
          end
        end
    end
  end