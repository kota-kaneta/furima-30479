require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入者情報とトークンの保存' do
    before do
      @purchase_shipping = FactoryBot.build(:purchase_shipping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @purchase_shipping.postal_code = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end

    it 'postal_codeはハイフン（-）がないと保存できないこと' do
      @purchase_shipping.postal_code = "1111111"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefecture_idが空だと保存できないこと' do
      @purchase_shipping.prefecture_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it 'prefecture_id選択なし(1)では保存できないこと' do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'municipalitiesが空だと保存できないこと' do
      @purchase_shipping.municipalities = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Municipalities can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @purchase_shipping.address = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping.phone_number = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end

    it 'phone_numberは12文字以上では保存できないこと' do
      @purchase_shipping.phone_number = "090123456789"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phon_numberはハイフン（-）があると保存できないこと' do
      @purchase_shipping.phone_number = "090-1234-5678"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it 'tokenが空だと保存できないこと' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
  end
end