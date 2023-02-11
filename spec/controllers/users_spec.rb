require 'rails_helper'
require 'json/ext'
RSpec.describe 'Users', type: :request do
  describe 'Testing GET #users/index' do
    before(:example) { get('/users#index') }
    it "expect to have 'ok' status " do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'should render correct placeholder in index the page' do
      expect(response.body.to_json).to include('Users index are coming soon!')
    end
    it 'should render correct placeholder in the page using assert_select' do
      assert_select 'h1', 'Users index are coming soon!'
    end
  end

  describe 'Testing GET #users/show' do
    before(:example) { get('/users/:id') }
    it "expect to have 'ok' status " do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'should render correct placeholder in the page' do
      expect(response.body.to_json).to include('Showing users!')
    end
    it 'should render correct placeholder in the show users page using assert_select' do
      assert_select 'h1', 'Showing users!'
    end
  end
end
