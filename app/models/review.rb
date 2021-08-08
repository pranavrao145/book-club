class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  validates :rating, presence: true
  validates :title, presence: true
end
