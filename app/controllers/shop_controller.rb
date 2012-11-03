class ShopController < ApplicationController
    def index

        @products = Product.all
        @categories = Category.all

        chceckBuyerSession
    end

    def prompt
        render :layout => false
    end

end
