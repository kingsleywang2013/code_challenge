class OffersController < ApplicationController
  before_action :set_offer, only: %i(edit update destroy)

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(update_params)
    if @offer.save
      render action: :index
    else
      @offer.valid?
      render action: :new
    end
  end

  def update
    @offer.update(update_params)
    render action: :index
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  private

  def set_offer
    @offer = Offer.find_by(id: params[:id])
  end

  def update_params
    params.require(:offer).permit(:grade, :season, :price, :quantity)
  end
end
