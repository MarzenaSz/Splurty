class QuotesController < ApplicationController

  before_filter :authorize_admin, only: :control

  def index
    # a random quote in our database is stored into the variable called @quote
    @quote = Quote.order("RANDOM()").first
  end
  # store our quote fields
  def create
    @quote = Quote.create(quote_params)
    
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    # send the user to the root_path
    redirect_to root_path
  end

  def about

  end

  def control

  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

  def authorize_admin
    #redirects to previous page and displays a message
    redirect_to :back, status: 401 unless current_user.admin
    
  end
end
