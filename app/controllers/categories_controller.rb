class CategoriesController < ApplicationController

    def show
        @category = Category.find(params[:id])
        @products = @category.products
        @categories = Category.all

        chceckBuyerSession
    end

    def names
        @categories = Category.all
    end

end
