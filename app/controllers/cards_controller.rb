class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :buy]
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "index" if card.exists?
  end

  def pay 
    Payjp.api_key = ENV["KEY"]
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "new"
      end
  end

  def delete 
    card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV["KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      if card.delete
        redirect_to action: "new", notice: "削除しました"
      else 
        redirect_to action: "index", alert: "削除できませんでした"
      end

  end

  def index
    card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV["KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      
      @card_brand = @default_card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "mastercard.png"
      when "American Express"
        @card_src = "american-express.png"
      when "Discover"
        @card_src = "discover.png"
      end

    end

    def edit
      Payjp.api_key = ENV["KEY"]
      card = Card.where(user_id: current_user.id).first
      @address = Address.find_by(user_id: current_user.id)
      if current_user.id == @product.id
        redirect_to root_path
      elsif @product.status == "2"
        redirect_to root_path
      end
      if card.present?
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end
  
    def buy
      Payjp.api_key = ENV['KEY']
      card = Card.where(user_id: current_user.id).first
      if current_user.id != @product.id && @product.status == "1"
        Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id, 
        currency: 'jpy'
      )
      end
    if @product.update(status: 2)
      redirect_to action: 'show'
    else
      redirect_to action: 'edit', notice: "購入できませんでした"
    end
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

end
