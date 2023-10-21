require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  before do
    @request.host = 'localhost:3000'
  end

  describe 'GET #show' do
    it 'assigns @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #new' do
    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end