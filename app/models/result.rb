class Result < ApplicationRecord
	belongs_to :user
	has_many :thumbsups
	has_many :thumbsup_users, through: :thumbsups, source: :user
	has_many :remarks

	mount_uploader :attachment, AttachmentUploader

end
