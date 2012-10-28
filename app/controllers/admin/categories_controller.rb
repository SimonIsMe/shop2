class Admin::CategoriesController < Admin::ApplicationController

    def index
        @categories = Category.all
    end

    def remove
        category = Category.find(params['id'])
        category.delete

        redirect_to '/admin/categories/'
    end

    def new
    end

    def create

       # render :text => params

        if params['id'] == nil
            category = Category.new
        else
            category = Category.find(params['id'])
        end

        category.name = params['name']
        category.save

        redirect_to '/admin/categories/'
    end

    def edit
        @category = Category.find(params['id'])
    end

end
