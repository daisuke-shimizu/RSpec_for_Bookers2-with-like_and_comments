require 'rails_helper'
RSpec.describe 'Favoriteモデルのテスト', type: :model do
    describe 'バリデーションのテスト' do
      let(:user) { create(:user) }
      let(:book) { create(:book, user_id: user.id) }

      context 'user_idカラム' do

        # let!とすると、毎回データを作成してくれる
          let!(:favorite_first) { create(:favorite, book_id: book.id, user_id: user.id) }
          it '1ユーザーが1つの本に対し、1回目のいいねができる' do
            expect(favorite_first.valid?).to eq true;
          end
          # buildで1ユーザーが1つの本に対し、2回目のいいねするという情報のレコードを作成。それがsaveされるかどうか？
        let!(:favorite_second) { build(:favorite, book_id: book.id, user_id: user.id) }
          it '1ユーザーが1つの本に対し、2回以上いいねできない' do
            expect(favorite_second.save).to eq false;
          end
      end
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