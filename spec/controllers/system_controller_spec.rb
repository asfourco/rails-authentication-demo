describe SystemController, type: :controller do
  describe 'GET' do
    it 'returns http success for root path' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
