require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:entity) { create(:entity, user:) }
  before do
    @request.host = 'localhost:3000'
  end

  describe 'GET #index' do
    it 'assigns @entities' do
      get :index, params: { user_id: user.id }
      expect(assigns(:entities)).to eq([entity])
    end

    it 'renders the index template' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template(:index)
    end
  end
end
