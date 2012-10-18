class Admin::ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def remove
        product = Product.find(params['id'])
        product.delete

        redirect_to '/admin/products/'
    end

    def new
        @categories = Category.all
    end

    def create

       # render :text => params

        if params['id'] == nil
            product = Product.new
        else
            product = Product.find(params['id'])
        end

        product.name = params['name']
        product.category_id = params['category_id']
        product.price = params['price'].to_i * 100
        product.save

        redirect_to '/admin/products/'
    end

    def edit
        @categories = Category.all
        @product = Product.find(params['id'])
    end

end
