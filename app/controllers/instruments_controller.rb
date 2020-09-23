class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :destroy]

  def index
    @instruments = Instrument.all
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

end
