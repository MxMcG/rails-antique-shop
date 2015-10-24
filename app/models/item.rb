class Item < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}

  has_many :cart_items

end
