class SearchController < ApplicationController

    def index
        chceckBuyerSession

        @products = Product.search(:name_cont => params[:search]).result(:distinct => true);
    end

end
