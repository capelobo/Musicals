class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :destroy]

  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = User.last.id
    @instrument.save
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render "instruments/new"
    end
  end


  def show
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_url, notice: 'Instrument was successfully destroyed.'
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

   def instrument_params
    params.require(:instrument).permit(:name, :price, :description)
  end

end
