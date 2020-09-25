class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :destroy]

  def index
    @myinstruments = Instrument.all.select { |x| x.user_id == User.last.id}
    if params[:query].present?
      @instruments = Instrument.search_by_name_and_description(params[:query])
    else
      @instruments = Instrument.all
    end


  end

  def edit
    set_instrument
  end

  def update
    set_instrument
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
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
    @instrument.user_id = User.last.id
    @instrument.delete
    redirect_to instruments_url, notice: 'Instrument was successfully destroyed.'
  end


  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end


   def instrument_params
    params.require(:instrument).permit(:name, :price, :description, :photo)
  end

end

