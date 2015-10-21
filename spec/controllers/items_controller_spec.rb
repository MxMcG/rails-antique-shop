require 'rails_helper'

describe ItemsController do
  describe '#show' do
    let(:it) { Item.create(name: 'asdf', description: 'fddfdd', price: 2) }
    it "should show an individual item" do
      get :show, id: it.id
      expect(assigns(:item)).to be_an Item
    end
  end

  describe '#new' do
    it 'should go to the new page' do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    context 'bad data does not get saved'
      # let(:item) { Item.new({}} }
      it 'should create a new item with bad params, but not save to the database' do
        expect{post :create, :item => {name: ""}}.to_not change{Item.count}
      end
    context 'good data does get saved'
      it 'should create a new item with good params, and save to the database' do
        expect{post :create, :item => {name: "test item", description: "This is a test item", price: 100}}.to change{Item.count}.by(1)
      end

  end

  describe '#edit' do
    it 'should go to the edit page' do
      get :edit
      expect(response.status).to eq 200
    end
  end

  # describe '#update' do
  # end

end
