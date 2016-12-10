describe SessionsController, type: :controller do
  describe 'GET' do
    it 'returns http success for /login' do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it 'returns http redirect for /logout' do
      get :destroy
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'POST' do
    before (:example) do
      User.create!(name: 'testy', email: 'best@test.com', password: 'besttest')
    end
    it 'return http redirect for login into system' do
      post :create, params: { email: 'best@test.com', password: 'besttest' }
      expect(response).to have_http_status(:redirect)
    end
  end
end
