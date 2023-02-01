require 'rails_helper'

RSpec.describe 'posts', type: :request do
  describe 'GET #posts' do
    before(:each) { get '/posts' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end

RSpec.describe 'render posts', type: :request do
  it 'loads /posts' do
    get '/posts'
    expect(response).to render_template('posts/index')
  end
  it 'loads /posts' do
    get '/posts'
    expect(response.body).to include('Posts INDEX')
  end
end
