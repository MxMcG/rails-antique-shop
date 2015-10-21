require 'rails_helper'
require 'spec_helper'
require 'shoulda-matchers'


describe Item do
  # subject { Item.new(name: 'asdfsd', description: 'asdflefsdf', price: 13)}
  it {should validate_presence_of(:name) }
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
end
