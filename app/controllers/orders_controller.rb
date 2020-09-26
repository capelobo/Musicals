class OrdersController < ApplicationController

  def new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @order = Order.new
    @order.instrument = Instrument.find(params[:instrument_id])
    @order.user = current_user

    if current_user == @order.instrument.user
      redirect_to instruments_url, notice: 'Ups! Você já é dono deste instrumento.'
    else 
      if @order.save
        redirect_to instruments_path
      else
        render :new
      end
    end

  end
end
