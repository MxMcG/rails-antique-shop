require 'rails_helper'

RSpec.describe CartItem, type: :model do
  context "#associations" do
    it {should belong_to :cart}
    it {should belong_to :item}
  end
end
