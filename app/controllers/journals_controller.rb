class JournalsController < ApplicationController
  
  def new
    @journal = Journal.new
  end
  def create
  end

  def show
    @journal = Journal.find(params[:id])
    respond_to do |format|
      format.js {render "show.js.erb"}
      format.html { render :show } #, flash[:success] = "holder updated")
    end
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
  end

  def create
    @journal = Journal.new(notes: params[:journal][:notes], trade_id: params[:journal][:trade_id], journal_date: DateTime.now.strftime('%m-%d-%Y'))
    @journal.save
    if  @journal.persisted?
      redirect_to trades_path
    else
      render :new                                                                                                                                                
    end
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
