class Shop < ApplicationRecord

belongs_to :owner
has_many :products
has_many :orders
end
