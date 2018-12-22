require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'Get #new' do
    before { get :new }
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end
end
