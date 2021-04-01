# frozen_string_literal: true

class User < ApplicationRecord
  has_many :participants
  has_many :events, through: :participants
  has_many :alerts
end
