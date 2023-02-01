require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'GET #users' do
    before(:each) { get '/users' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end


RSpec.describe 'render users', type: :request do
  it 'loads /users' do
    get '/users'
    expect(response).to render_template('users/index')
  end
  it 'render /users' do
    get '/users'
    expect(response.body).to include('Users INDEX')
  end
end
