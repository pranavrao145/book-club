# frozen_string_literal: true

class Starter < ApplicationRecord
  belongs_to :discussion
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :replies
end
