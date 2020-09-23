class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show]

  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.save
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render "instruments/new"
    end
  end


  def show
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

   def instrument_params
    params.require(:instrument).permit(:name, :price, :description, :photo)
  end

end
