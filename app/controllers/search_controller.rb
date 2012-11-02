class SearchController < ApplicationController

    def index
        chceckBuyerSession

        if params[:price_to] == ''
            params[:price_to] = '9999999'
        end

        if params[:price_from] == ''
            params[:price_from] = '0'
        end

        @products = Product.search(:name_cont => params[:search], :price_gteq => params[:price_from].to_i*100, :price_lteq => params[:price_to].to_i*100).result(:distinct => true);
    end


end
