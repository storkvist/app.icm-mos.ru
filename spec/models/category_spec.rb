require 'rails_helper'

describe Category do
  describe 'associations' do
    it { is_expected.to have_many(:kits).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
