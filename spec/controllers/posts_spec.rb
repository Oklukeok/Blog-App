require 'rails_helper'
require 'json/ext'
RSpec.describe 'Posts', type: :request do
  describe 'Testing GET posts for an user #posts/index' do
    before(:example) { get('/users/:id/posts#index') }
    it "expect to have 'ok' status " do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'should render correct placeholder in index posts page' do
      expect(response.body.to_json).to include('Posts are coming soon!')
    end
    it 'should render correct placeholder in the page using assert_select' do
      assert_select 'h1', 'Posts are coming soon!'
    end
  end

  describe 'Testing GET posts for an user #posts/:id' do
    before(:example) { get('/users/:id/posts/:id') }
    it "expect to have 'ok' status " do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'should render correct placeholder in index posts page' do
      expect(response.body.to_json).to include('Showing Posts!')
    end
    it 'should render correct placeholder in the show page using assert_select' do
      assert_select 'h1', 'Showing Posts!'
    end
  end
end
