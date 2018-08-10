require 'rails_helper'

describe Kit do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:scale) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:article) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:scale) }
  end
end
