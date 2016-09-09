class Comment < ApplicationRecord
	validates :body, presence: true
  belongs_to :project
  belongs_to :user
end
