class Public::SearchesController < ApplicationController
  def search
    @items = Item.all
  end
end
