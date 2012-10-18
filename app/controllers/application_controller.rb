class ApplicationController < ActionController::Base

    def chceckBuyerSession
        if session[:buyer_id] == nil
            @buyer = Buyer.new;
            @buyer.save
            @buyer.orders.create
            session[:buyer_id] = @buyer.id
        else
            @buyer = Buyer.find(session[:buyer_id])
        end

        #render :text => session
    end

    protect_from_forgery

end
