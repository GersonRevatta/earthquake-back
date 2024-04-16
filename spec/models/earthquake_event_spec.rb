# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EarthquakeEvent, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_presence_of(:mag_type) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }

    it do
      is_expected.to validate_numericality_of(:magnitude)
        .is_greater_than_or_equal_to(-1.0)
        .is_less_than_or_equal_to(10.0)
    end

    it do
      is_expected.to validate_numericality_of(:latitude)
        .is_greater_than_or_equal_to(-90.0)
        .is_less_than_or_equal_to(90.0)
    end

    it do
      is_expected.to validate_numericality_of(:longitude)
        .is_greater_than_or_equal_to(-180.0)
        .is_less_than_or_equal_to(180.0)
    end

    it do
      is_expected.to validate_uniqueness_of(:title)
        .scoped_to(:magnitude, :latitude, :longitude)
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
