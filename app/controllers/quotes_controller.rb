class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered in invalid.'
      redirect_to new_quote_path
    else
      redirect_to root_path
    end
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
