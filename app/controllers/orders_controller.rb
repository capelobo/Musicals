class OrdersController < ApplicationController

  def new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @order = Order.new
    @order.instrument = Instrument.find(params[:instrument_id])
    @order.user = current_user
    if @order.save
      redirect_to instruments_path
    else
      render :new
    end

  end
end
