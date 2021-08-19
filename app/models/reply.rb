# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :content, presence: true, length: { minimum: 0, maxmium: 1000 }
end
