require 'rails_helper'

RSpec.describe PriceTable, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :trainees }
    it { is_expected.to have_db_column :pricePoint }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :trainees }
    it { is_expected.to validate_presence_of :pricePoint }
  end
  
  describe 'Associations' do
    it { is_expected.to have_many :sessions }
  end

  describe FactoryBot do
    it 'should have valid Factory' do
      expect(create(:price_table)).to be_valid
    end
  end
end
