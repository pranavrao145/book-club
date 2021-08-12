# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  validates :rating, presence: true
  validates :title, presence: true

  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('name LIKE ?', "%#{pattern}%")
    end
  end
end
