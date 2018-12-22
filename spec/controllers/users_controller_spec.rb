require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){ create(:user) }

  describe 'GET #new' do
    before { get :new }
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns new @user' do
      expect(assigns(:user)).to be_a_new User
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do

    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: user.id_name }
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq user
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: user.id_name }
    end
    it 'has 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq user
    end

    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'Delete #destroy' do
    before do
      delete :destroy, params: { id: user.id_name }
    end

    it 'has 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq user
    end
  end
end
