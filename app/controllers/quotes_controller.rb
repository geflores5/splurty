class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.author != "Yoda"
      flash[:error] = '<strong>MUST BE YODA</strong>.'
    elsif @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> Must be longer/shorter quote.'
    end
      redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
