# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :replies, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
