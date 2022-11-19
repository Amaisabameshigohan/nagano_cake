class Public::SearchesController < ApplicationController
  def search
    @items = Item.page(params[:page]).search(params[:word])
    @genres = Genre.all
  end
end
