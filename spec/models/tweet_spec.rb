require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'tweet' do
    before :all do
      @user = FactoryBot.create(:user)
      FactoryBot.create(:tweet, tweet_by: @user.id)
      FactoryBot.create(:tweet, tweet_by: @user.id)
    end
    it 'vaerify tweets has been created on behalf of user' do
      expect(@user.tweets.count).to eq(2)
    end
  end
end
