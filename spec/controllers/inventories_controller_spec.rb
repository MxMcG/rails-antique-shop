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
  # describe 'post #create' do
  #   login_admin
  #   before (:each) do
  #     get :new
  #   end
  #   it 'renders a new inventory form' do
  #     expect(response).to have_rendered(:form)
  #   end
  # end
  describe 'get #edit' do
    login_admin
    before (:each) do
      get :edit
    end
    it 'renders an edit form' do
      expect(response).to have_rendered(:form)
    end
  end



end
