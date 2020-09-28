class OrdersController < ApplicationController
  def new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @order = Order.new
    @order.instrument = Instrument.find(params[:instrument_id])
    @order.user = current_user

    if current_user == @order.instrument.user
      redirect_to instruments_url, notice: 'Ups! You already owns this instrument.'
    else
      if @order.save
        InstrumentsController.sell(@order.instrument)
        redirect_to instruments_path, notice: "You just bought the #{@order.instrument.name}."
      else
        render :new
      end
    end
  end

  def index
    @my_orders = Order.all.select { |order| order.user_id == current_user.id}
  end
end
