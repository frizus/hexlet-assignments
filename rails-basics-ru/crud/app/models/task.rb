# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :creator, presence: true
  validates :completed, inclusion: { in: [true, false] }

  attribute :status, default: -> { 'new' }
  attribute :completed, :boolean
end
