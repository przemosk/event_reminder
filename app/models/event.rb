# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants
  has_many :alerts

  with_options presence: true do
    validates :name, :start_date
  end
end
