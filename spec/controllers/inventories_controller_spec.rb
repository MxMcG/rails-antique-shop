require 'rails_helper'

describe InventoriesController do
  let(:item) { FactoryGirl.create(:item) }
  let(:attributes) { FactoryGirl.attributes_for :article}
  describe 'get #index' do
    login_admin
    before (:each) do
      get :index
    end
    it 'should respond with a 200' do
      expect(response.status).to eq(200)
      expect(assigns[:inventories]).to be_a(ActiveRecord::Relation)
    end
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end
  describe 'get #show' do
    login_admin
    before (:each) do
      get :show, id: item.id
    end
    it 'renders the show template' do
      expect(response).to have_rendered(:show)
    end
  end
  describe 'get #new' do
    login_admin
    before (:each) do
      get :new
    end
    it 'renders a new inventory form' do
      expect(response).to have_rendered(:form)
      expect(assigns[:inventory]).to be_a Item
    end
  end

  describe 'post #create' do
    login_admin
    let(:item){Item.new}
    context 'when creating a new item' do
      before do
        expect(Item).to receive(:new).with("name" => "bobby", "description" => "heyheyhey", "price" => "3")
        expect(item).to receive(:save).and_return(save_return_value)
        post :create, deck:{"name" => "bobby", "description" => "heyheyhey", "price" => "3"}
        expect(assigns[:item]).to be Item
      end
    end
  end
  describe 'get #edit' do
    let(:new_item) {Item.create(name: "check", description: "hey hey hey", price: 5)}
    login_admin
    before (:each) do
      get :edit, {name: "check", description: "hey hey hey", price: 3}
      expect(assigns[:new_item]).to eq(:new)
    end
    it 'renders an edit form' do
      expect(response).to have_rendered(:form)
    end
  end
  describe 'delete #destroy' do
    let(:destroy_item){Item.create(name: "check", description: "hey hey hey", price: 5)}
    login_admin
    it 'destroys an item' do
      get :destroy, inventory: destroy_item
      expect(response).to change(Item, :count).by(-1)
    end
  end



end
