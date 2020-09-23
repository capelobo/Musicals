class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show]

  def index
    @instruments = Instrument.all
  end

  def show

  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

end
