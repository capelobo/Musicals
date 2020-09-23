class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :destroy]

  def index
    @instruments = Instrument.all
  end

  def edit
    set_instrument
  end

  def update
    set_instrument
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
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
    params.require(:instrument).permit(:name, :description, :price)
  end

end
