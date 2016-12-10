describe CatController, type: :controller do
  describe 'GET' do
    it 'returns http failure for /cat without authentication' do
      get :show
      expect(response).to have_http_status(:redirect)
    end
  end
end
