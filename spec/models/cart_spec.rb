require 'rails_helper'

RSpec.describe Cart, type: :model do
  context '#associations' do
    it {should belong_to :user}
    it {should have_many :cart_items}
  end
end
