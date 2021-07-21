class Review < ApplicationRecord
  belongs_to :book
  belongs_to :author, :class_name => 'User'
end
