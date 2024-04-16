# frozen_string_literal: true

FactoryBot.define do
  factory :earthquake_event do
    external_id { 'ak0243hxub23' }
    magnitude { 1.2 }
    place { '67 km WNW of Tyonek, Alaska' }
    time { 1_710_601_894_869 }
    url { 'https://earthquake.usgs.gov/earthquakes/' }
    tsunami { false }
    mag_type { 'ml' }
    type_feature { 'Feature' }
    title { 'M 1.2 - 67 km WNW of Tyonek, Alaska' }
    longitude { -152.3121 }
    latitude { 61.2889 }
  end
end
