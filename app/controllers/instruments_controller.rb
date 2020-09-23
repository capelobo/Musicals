class InstrumentsController < ApplicationController

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



end


private

def set_instrument
  @instrument = Instrument.find(params[:id])
end

def instrument_params
  params.require(:instrument).permit(:name, :description, :price)
end
