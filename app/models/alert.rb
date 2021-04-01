# frozen_string_literal: true

class Alert < ApplicationRecord
  has_many :events
  has_many :users

  # add validation to prevent add same alerts
end
