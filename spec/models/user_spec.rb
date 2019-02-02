require 'rails_helper'
require './features/support/omni_auth_fixtures'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :role }
		it { is_expected.to have_db_column :encrypted_password }
		it { is_expected.to have_db_column :provider }
		it { is_expected.to have_db_column :uid }

  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe FactoryBot do
    it 'should have valid Factory' do
      expect(create(:user)).to be_valid
    end
	end

	describe 'OAuth methods' do
		let(:auth_response) {OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock)}
		let(:auth_params) {OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_params)}
    it "creates an instance from an oauth hash" do
      create_user = lambda {User.from_omniauth(auth_response, auth_params)
      }
      expect{create_user.call}.to change{User.count}.from(0).to(1)
    end
  end
end
