class Public::SearchesController < ApplicationController
  def search
    @model = params[:model]
    if @model == 'genre'
      @items = Item.page(params[:page]).per(8).search(params[:word])
    else
      @items = Item.page(params[:page]).per(8).search(params[:content])
    end
    @genres = Genre.all
  end
end
