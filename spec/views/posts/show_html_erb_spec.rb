require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'Post show page process' do
    before(:each) do
      @user = User.create(name: 'Diego', photo: 'https://i.imgur.com/1JZ1Q2r.jpg', bio: 'I am a biology teacher',
                          posts_counter: 2)
      @user2 = User.create(name: 'Marcos', photo: 'https://i.imgur.com/1JZ1Q2r.jpg', bio: 'I am a math teacher',
                           posts_counter: 3)
      @first_post = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post',
                                comments_counter: 0, likes_counter: 0)
      Comment.create(post_id: @first_post.id, author_id: @user2.id, text: 'This the first post comment')

      visit post_show_path(@user, @first_post)
    end

    it "should show a post's title" do
      expect(page.body).to have_content(@first_post.title)
    end

    it 'should show who wrote the post' do
      expect(page).to have_content(@first_post.user.name)
    end

    it 'should show how many comments it has' do
      expect(page.body).to have_content(@first_post.comments_counter.to_s)
    end

    it 'should show how many likes it has' do
      expect(page.body).to have_content(@first_post.likes_counter.to_s)
    end

    it 'should show the post body' do
      expect(page.body).to have_content(@first_post.text)
    end

    it 'should show the username of each commentor' do
      expect(page).to have_content(@user2.name)
    end

    it 'should show the comment body' do
      expect(page.body).to have_content('This the first post comment')
    end
  end
end
