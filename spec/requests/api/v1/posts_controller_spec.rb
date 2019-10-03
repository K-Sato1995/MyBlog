require 'rails_helper'

describe 'API::V1::PostsController' do
  let(:author) { create(:author) }
  let!(:posts) { 5.times { create(:post) } }

  describe 'GET /api/v1/posts' do
    let(:json) { JSON.parse(response.body) }
    before { get '/api/v1/posts' }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'sends a list of posts' do
      expect(json['data'].length).to eq(4)
      expect(json['data']['posts'].length).to eq(5)
    end
  end

  describe 'GET /api/v1/posts/:id' do
    let(:json) { JSON.parse(response.body) }
    let(:post) do
      post = create(:post)
      post.comments.create(name: 'name', content: 'content', status: 1)
      post
    end
    before { get "/api/v1/posts/#{post.id}" }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'sends a specific post' do
      expect(json['data']['post']['title']).to eq(post.title)
    end

    it 'sends associated comments with the post' do
      expect(json['data']['comments'].size).to eq(1)
    end
  end

  describe 'GET /api/v1/posts_list' do
    let(:json) { JSON.parse(response.body) }
    before { get '/api/v1/posts_list' }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'sends a list of posts' do
      expect(json['data']['posts'].length).to eq(5)
    end
  end

  describe 'PUT /api/v1/posts/:id/like' do
    let!(:post) { create(:post) }

    before { put "/api/v1/posts/#{post.id}/like" }

    it 'adds 1 like' do
      expect(JSON.parse(response.body)['data']['like']).to eq(1)
    end
  end
end
