# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user, email: 'user@test.com')
  end

  describe '#create' do
    it 'should verify forgot password' do
      post :create, params: { email: 'user@test.com' }, format: :json
      expect(response.status).to eq(200)
    end
  end

end
