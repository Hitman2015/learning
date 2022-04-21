class StoreController < ApplicationController
  include StoreSessionCounter
  before_action :store_session_counter

  def index
    @products = Product.order(:title)
  end
  
end
