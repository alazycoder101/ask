require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:question) { create(:question) }
  let(:user) { create(:user) }

  describe "GET /index" do
    it 'shows page' do
      get "/questions"

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it 'successful' do
      expect(question.reload.views_count).to eq(0)

      get "/questions/#{question.id}"

      expect(response).to have_http_status(:ok)
      expect(question.reload.views_count).to eq(1)
    end
  end

  describe "POST /follow" do
    it 'redirect' do
      post "/questions/#{question.id}/follow"

      expect(response).to have_http_status(302)
    end

    it 'follows the question' do
      sign_in(user)
      post "/questions/#{question.id}/follow"

      expect(response).to have_http_status(:created)
      expect(user.follow?(question)).to be_truthy
    end
  end

  describe "POST /unfollow" do
    it 'redirect' do
      post "/questions/#{question.id}/unfollow"

      expect(response).to have_http_status(302)
    end

    it 'unfollows the question' do
      user.follow(question)
      expect(user.follow?(question)).to be_truthy

      sign_in(user)
      post "/questions/#{question.id}/unfollow"

      expect(response).to have_http_status(:created)
      expect(user.follow?(question)).to be_falsy
    end
  end

  describe "POST /upvote" do
    it 'redirects to login' do
      post "/questions/#{question.id}/upvote"

      expect(response).to have_http_status(302)
    end

    it 'upvote the question' do
      sign_in(user)
      post "/questions/#{question.id}/upvote"

      expect(response).to have_http_status(:created)
      expect(question.votes_for.up.count).to equal(1)
    end
  end

  describe "POST /downvote" do
    it 'redirects to login' do
      post "/questions/#{question.id}/downvote"

      expect(response).to have_http_status(302)
    end

    it 'upvote the question' do
      sign_in(user)
      post "/questions/#{question.id}/downvote"

      expect(response).to have_http_status(:created)
      expect(question.votes_for.down.count).to equal(1)
    end
  end

  describe "POST /create" do
    let (:question_params) {
      {
        title: 'my question',
        body: 'my question body'
      }
    }

    it 'redirects to login' do
      post "/questions", params: { question: question_params }

      expect(response).to have_http_status(302)
    end

    it 'creates the question' do
      sign_in(user)
      post "/questions", params: { question: question_params }

      expect(response).to have_http_status(302)
      expect(flash.notice).to include('created')
      expect(Question.count).to equal(1)
    end
  end
end
