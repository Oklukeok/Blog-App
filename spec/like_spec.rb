require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
  subject { Like.create(author_id: user.id, post_id: post.id) }
  before { subject.save }

  it 'post_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should increase in 1' do
    update_like = subject.update_likes_counter
    expect(update_like.likes_counter).to eql 1
  end
end
