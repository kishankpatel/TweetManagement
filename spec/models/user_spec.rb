require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create user' do
    before :all do
      User.destroy_all
      FactoryBot.create(:user, is_admin: true)
      FactoryBot.create(:user)
      FactoryBot.create(:user)
    end
    it 'verify admin and non-admin count' do
      expect(User.count).to eq(3)
      expect(User.where(is_admin: true).count).to eq(1)
      expect(User.where(is_admin: false).count).to eq(2)
    end
  end
end
