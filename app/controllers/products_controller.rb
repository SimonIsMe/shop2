class ProductsController < ApplicationController

  def show

    @product = Product.find(params[:id])

    #render :text => params[:id]
  end

end
