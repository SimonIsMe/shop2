class OrdersController < ApplicationController

    def index
        chceckBuyerSession

        @buyer.order

        @orderItems
    end

    # dodawanie produktu do koszyka
    def create

        @buyer = Buyer.find(params[:buyer_id])

        orderItem = OrderItem.new
        orderItem.order_id = 5 #@buyer.orders
        orderItem.product_id = params['product_id']
        orderItem.quantity = params['quantity']
        orderItem.save

        render :text => params
    end

end