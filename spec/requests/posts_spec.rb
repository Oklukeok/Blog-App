require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'returns http index success' do
      expect(response).to have_http_status(:success)
    end

    it "should render 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given post')
    end

    it "does not render a 'show' template" do
      expect(response).to_not render_template(:show)
    end
  end
end
