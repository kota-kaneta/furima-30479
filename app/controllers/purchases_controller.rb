class PurchasesController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :set_root, only: [:index, :create]

  def index
    authenticate_user!
    @purchase = PurchaseShipping.new
  end

  def create
    @purchase = PurchaseShipping.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :token, :product_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_root
    if current_user.id == @product.user_id
      redirect_to root_path
    elsif request.referer.nil?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
