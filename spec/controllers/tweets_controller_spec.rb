# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  before(:each) do
    @admin_user = FactoryBot.create(:user, is_admin: true)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @tweet1 = FactoryBot.create(:tweet, tweet_by: @user1.id)
    @tweet2 = FactoryBot.create(:tweet, tweet_by: @user1.id)
  end

  describe '#index' do
    it "should verify user can't read tweets with out login" do
      get :index, format: :json
      expect(response.status).to eq(401)
    end
    it "should verify after signin user can read tweets" do
      sign_in_as(@user1)
      get :index, format: :json
      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end

  describe '#create' do
    it "should verify a user can tweet after signin" do
      sign_in_as(@user2)
      post :create, params: {tweet: {name: 'test', description: 'sample description'}}, format: :json
      expect(response.status).to eq(201)
    end
  end

  describe '#destroy' do
    it "should verify a user can't delete a tweet of someone else" do
      sign_in_as(@user2)
      delete :destroy, params: {id: @tweet1.id}, format: :json
      expect(response.status).to eq(401)
    end
    it "should verify a user can delete his/her own tweet" do
      sign_in_as(@user1)
      delete :destroy, params: {id: @tweet1.id}, format: :json
      expect(response.status).to eq(200)
    end
    it "should verify a admin can delete a tweet of someone else" do
      sign_in_as(@admin_user)
      delete :destroy, params: {id: @tweet2.id}, format: :json
      expect(response.status).to eq(200)
    end
  end

end
