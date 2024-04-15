# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :earthquake_event

  validates :body, presence: true
end
