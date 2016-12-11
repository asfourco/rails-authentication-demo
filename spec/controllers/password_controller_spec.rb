describe PasswordController, type: :controller do
  describe 'GET' do
    it 'returns an http success to route /user/reset' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'POST' do
    it 'returns an http redirect on success' do
      post :reset, params: { email: 'test@domain.com' }
      expect(response).to redirect_to(root_url)
    end
  end
end
