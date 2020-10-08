require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    it 'すべての項目があれば登録できること' do
      expect(@product).to be_valid
    end

    it 'titleが空では登録できないこと' do
      @product.title = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Title can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @product.description = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end

    it 'imageは空だと登録できないこと' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは半角数字のみ登録できること' do
      @product.price = '１０００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは300円未満では登録できないこと' do
      @product.price = '200'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than 300')
    end

    it 'priceは9999999円以上は登録できないこと' do
      @product.price = '10000000000000'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be less than 9999999')
    end

    it 'chrge_idが1（選択なし）では登録できないこと' do
      @product.charge_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Charge must be other than 1')
    end

    it 'day_idが1（選択なし）では登録できないこと' do
      @product.day_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Day must be other than 1')
    end

    it 'source_idが1（選択なし）では登録できないこと' do
      @product.source_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Source must be other than 1')
    end

    it 'category_idが1（選択なし）では登録できないこと' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 1')
    end

    it 'status_idが1（選択なし）では登録できないこと' do
      @product.status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Status must be other than 1')
    end
  end
end
