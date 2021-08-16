# frozen_string_literal: true

class Discussion < ApplicationRecord
  has_one :starter
  has_many :replies, through: :starters
end
