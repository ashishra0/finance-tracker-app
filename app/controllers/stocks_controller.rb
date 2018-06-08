class StocksController < ApplicationController
  def search
    if params[:stock].present? # if there is any string present
      @stock =  Stock.new_from_lookup(params[:stock]) # pass the string in this method
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = "Invalid ticker, Enter a valid ticker"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "Please enter a ticker"
      redirect_to my_portfolio_path
    end
  end
end