# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :earthquake_event
    body { 'body' }
  end
end
