class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def show
    @trades = Trade.find(params[:id])
  end

  def edit
  end

  def new
  end
end
