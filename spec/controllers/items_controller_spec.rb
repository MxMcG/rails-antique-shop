require 'rails_helper'

describe ItemsController do
  describe '#show' do
    let(:it) { Item.create(name: 'asdf', description: 'fddfdd', price: 2) }
    it "should show an individual item" do
      get :show, id: it.id
      expect(assigns(:item)).to be_an Item
    end
    #test that the right template got rendered
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
      item = Item.create(name: "lksj", description: "dlkwjee", price: 2)
      get :edit, { id: item.id }
      expect(response.status).to eq 200
    end
  end

  describe '#update' do
    it 'should update item in database' do
      item = Item.create(name: "lksj", description: "dlkwjee", price: 2)
      old_price = item.price
      put :update, id: item.id, item: { name: item.name, item: item.description, price: 5 }
      expect(item.price).not_to eq(old_price)
    end
  end

  describe '#destroy' do
    item = Item.create(name: "lksj", description: "dlkwjee", price: 2)
    it 'decrements item count in database' do
      item_id = item.id
      expect {
        delete :destroy, id: item_id
      }.to change { Item.count }.by(-1)
    end
    it 'redirects to the root path' do
      item_id = item.id
      delete :destroy, id: item_id
      expect(response.status).to eq(302)
    end
  end

end
