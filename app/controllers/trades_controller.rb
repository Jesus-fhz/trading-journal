class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def show
    @trades = Trade.find(params[:id])
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new trade_params
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
    #Don't perform the edit on this item if the ids don't match
    # if @trade.user_id != @current_user.id #Trying to edit something that's from its user
    #     return redirect_to login_path 
    # end
    if @trade.update trade_params
      redirect_to trade_path(@trade.id)
    else
      render :edit
    end
  end

  private def trade_params
    params.require(:trade).permit(:platform, :symbol, :type_id, :entry_date, :entry_price, :entry_amount, :exit_price, :leverage, :exit_date)
  end

  
end
