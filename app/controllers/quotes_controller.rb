class QuotesController < ApplicationController
  def index
    # A random quote in our database is stored into the variable called @quote
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end
end
