class AddressesController < ApplicationController
  before_action :news, only: [:new, :mypage_new]
  before_action :creates, only: [:create, :mypage_create]

  def new
  end

  def create
    if @address.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def mypage_new
  end

  def mypage_create
    if @address.save
      redirect_to user_path(id: current_user.id)
    else
      render 'mypage_new'
    end
  end

  def edit
    binding.pry
    @address = current_user.address
    redirect_to mypage_new_addresses_path if @address.blank?
  end

  def update
    address = Address.find_by(user_id: current_user.id)
    address.update(address_params)
    redirect_to user_path(id: current_user.id)
  end

  private
  def address_params
    params.require(:address).permit(:address_number, :prefecture, :city, :town, :house_number).merge(user_id: current_user.id)
  end

  def news
    @address = Address.new
  end

  def creates
    @address = Address.create(address_params)
  end

end
