class Result < ApplicationRecord
	belongs_to :user
	has_many :thumbsups
	has_many :thumbsup_users, through: :thumbsups, source: :user

	mount_uploader :attachment, AttachmentUploader

end
