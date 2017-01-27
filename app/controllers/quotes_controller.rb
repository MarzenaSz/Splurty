class QuotesController < ApplicationController
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

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
