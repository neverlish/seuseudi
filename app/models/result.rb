class Result < ApplicationRecord
	belongs_to :user

	mount_uploader :attachment, AttachmentUploader

end
