class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
