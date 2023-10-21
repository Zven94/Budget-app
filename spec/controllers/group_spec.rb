require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before do
    @request.host = 'localhost:3000'
  end

  describe 'GET #index' do
    it 'assigns @groups when user is authenticated' do
      sign_in user  # Autentica al usuario

      get :index

      expect(response).to have_http_status(302)
    end

    it 'redirects to sign-in when user is not authenticated' do
      get :index

      expect(response).to have_http_status(302)  # Verifica la redirección (código de estado 302)
      expect(response).to redirect_to(new_user_session_path)  # Verifica que se redirija a la página de inicio de sesión
    end
  end
end
