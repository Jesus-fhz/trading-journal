class JournalsController < ApplicationController
  
  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
  end

  def index
  end

  def destroy
    journal = Journal.find(params[:id])
    if journal.destroy
      flash[:notice] = "Item has been deleted!"
    else
      flash[:error] = "There's been an error deleting the item, contact admin."
    end
    redirect_to trade_path(journal.trade.id)
  end
end
