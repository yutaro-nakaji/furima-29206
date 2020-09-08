require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image/name/explanation/category_id/status_id/shipping_charges_id/shipping_region_id/days_until_shipping_id/price/user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1（カテゴリーが未選択）だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'status_idが1（商品の状態が未選択）だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'shipping_charges_idが1（発送料の負担が未選択）だと登録できない' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges Select')
      end
      it 'shipping_region_idが1（発送元の地域が未選択）だと登録できない' do
        @item.shipping_region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping region Select')
      end
      it 'days_until_shipping_idが1（発送までの日数が未選択）だと登録できない' do
        @item.days_until_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days until shipping Select')
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceは半角数字でないと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
