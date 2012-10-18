class Buyer < ActiveRecord::Base
    # attr_accessible :title, :body

    has_many :orders
end
