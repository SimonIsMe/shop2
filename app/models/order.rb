class Order < ActiveRecord::Base
    attr_accessible :buyer_id, :confirmed

    belongs_to :buyer

    def getOrderItems
        return OrderItem.find(:all, :conditions => ["order_id = ?", self.id])
    end
end
