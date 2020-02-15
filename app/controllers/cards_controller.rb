class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay 
    Payjp.api_key = 'sk_test_1256cf4bf13b352e5a9ced9f'
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "new"
      end
  end

  def delete 
    card = Card.where(user_id: current_user.id).first
      Payjp.api_key = 'sk_test_1256cf4bf13b352e5a9ced9f'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      if card.delete
        redirect_to action: "new", notice: "削除しました"
      else #削除に失敗した時にアラートを表示します。
        redirect_to action: "show", alert: "削除できませんでした"
      end

  end

  def show 
    card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = 'sk_test_1256cf4bf13b352e5a9ced9f'
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


end
