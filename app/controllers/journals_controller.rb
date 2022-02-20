class JournalsController < ApplicationController
  before_action :check_if_logged_in
  layout "panel"
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
    @journal = Journal.find_by(id: params[:id])
    if @journal.update journal_params()
      flash[:notice] = "Note has been modified!"
    else
      flash[:error] = "There's been an error creating the note"
    end
    redirect_to trade_path(params[:journal][:trade_id])
  end

  def create
    @journal = Journal.new(notes: params[:journal][:notes], trade_id: params[:journal][:trade_id], journal_date: DateTime.now)
    @journal.save
    if  @journal.persisted?
      flash[:notice] = "Your note has been added!"
    else
      flash[:error] = "There's been an error creating the note"
    end
    redirect_to trade_path(params[:journal][:trade_id])
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

  private def journal_params
    params.require(:journal).permit(:notes, :journal_date, :trade_id)
  end
end
