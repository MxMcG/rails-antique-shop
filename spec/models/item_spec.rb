require 'rails_helper'
require 'spec_helper'
require 'shoulda-matchers'


describe Item do
  it {should validate_presence_of(:name) }
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
  it { should validate_numericality_of :price }
  context '#associations' do
    it {should have_many :cart_items}
  end
end
