describe UserController, type: :controller do
  describe 'GET' do
    it 'return http success for /register' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST' do
    it 'returns http redirect for submitting registration' do
      post :create, params: { user: {
        name: 'testyb', 
        email: 'testy@best.ca', 
        password: 'testyb123', 
        password_confirmation: 'testyb123' 
        }
      }
      expect(response).to redirect_to(root_url)
    end
  end
end
