require 'rails_helper'
require 'json/ext'

RSpec.describe 'User show page', type: :feature do
  describe 'User show page process' do
    before(:each) do
      @user = User.create(name: 'Diego', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'I´m a student', posts_counter: 2)
      Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
      Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
      Post.create(author_id: @user.id, title: 'My third post', text: 'This is my third post')
      Post.create(author_id: @user.id, title: 'My fourth post', text: 'This is my fourth post')

      visit user_path(@user.id)
    end

    it 'should show the user profile picture' do
      expect(page).to have_xpath("//img[@src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'should show the user username' do
      expect(page.body).to have_content(@user.name)
    end

    it 'should show the number of post the user has writen' do
      expect(page.body).to have_content(@user.posts_counter.to_s)
    end

    it 'should sho wthe the users bio' do
      expect(page).to have_content(@user.bio)
    end

    it "should show a button that lets me view all of a user's posts" do
      expect(page).to have_content('See All Posts')
    end

    it "When I click to see all posts, it should redirects me to the user's post's index page" do
      click_link('See All Posts')
      expect(page).to have_current_path(post_path_path(@user))
    end

    it 'displays the last 3 posts' do
      visit user_path(@user)
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
      expect(page).to have_content('This is my fourth post')
    end
  end
end
