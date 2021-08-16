class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :author, class_name: 'User', foreign_key: :author_id
end
