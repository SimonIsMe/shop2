class ProductsController < ApplicationController

    def show
        #render :text => 'dd'

        @product = Product.find(params[:id])

        chceckBuyerSession

        #render :text => params
    end

end
