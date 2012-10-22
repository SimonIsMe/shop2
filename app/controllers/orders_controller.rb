class OrdersController < ApplicationController

    def index
        chceckBuyerSession

        @order = @buyer.orders[0]

        #render :text => @buyer.orders[0].getOrderItems
    end

    # dodawanie produktu do koszyka
    def create

        session[:buyer_id] = params[:buyer_id]

        @buyer2 = Buyer.find(params[:buyer_id])

        orderItem = OrderItem.new
        orderItem.order_id = @buyer2.orders[0].id
        orderItem.product_id = params['product_id']
        orderItem.quantity = params['quantity']
        orderItem.price = params['price']
        orderItem.save

        redirect_to '/orders/'
    end

    # usuwanie z koszyka
    def remove
        OrderItem.find(params['id']).delete

        redirect_to '/orders/'
    end

    # akceptowanie zamówienia
    def accept
        chceckBuyerSession

        @buyer.orders[0].confirmed = 1
        @buyer.orders[0].save

        session[:buyer_id] = nil
    end

end