# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :rating, presence: true
  validates :title, presence: true, length: {minimum: 0, maxmium: 100}
  validates :content, length: {minimum: 0, maxmium: 1000}
end
