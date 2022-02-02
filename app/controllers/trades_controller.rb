class TradesController < ApplicationController

  before_action :check_if_logged_in

  def index
    @trades = Trade.where(user_id: @current_user.id)
  end

  def show
    @trades = Trade.find(params[:id])
    redirect_to login_path unless @trades.user_id == @current_user.id 
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new trade_params
    @trade  = Trade.push_data(@trade)
    @trade.save
    if  @trade.persisted?
      redirect_to trades_path    
    else
      render :new                                                                                                                                                
    end
  end

  def destroy
    trade = Trade.find(params[:id])
    if trade.destroy
      redirect_to trades_path
      flash[:notice] = "Item has been deleted!"
    else
      redirect_to trade_path(params[:id])
      flash[:error] = "There's been an error deleting the item, contact admin."
    end
  end

  def update
    @trade = Trade.find  params[:id]
    @trade  = Trade.push_data(@trade)
    if @trade.update trade_params
      redirect_to trade_path(@trade.id)
    else
      render :edit
    end
  end

  
  private def trade_params
    user = { user_id: @current_user.id }
    params.require(:trade).permit(:platform, :symbol, :type_id, :entry_date, :entry_price, :entry_amount, :exit_price, :leverage, :exit_date,:perpetual_id).reverse_merge(user)
  end

  
end
