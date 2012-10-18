class ProductsController < ApplicationController

    def show
        @product = Product.find(params[:id])

        chceckBuyerSession

        render :text => params
    end

end
