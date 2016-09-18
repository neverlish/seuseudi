class Result < ApplicationRecord
	belongs_to :user
	belongs_to :project

	has_many :thumbsups, dependent: :destroy
	has_many :thumbsup_users, through: :thumbsups, source: :user
	has_many :remarks, dependent: :destroy

	mount_uploader :attachment, AttachmentUploader
	mount_uploader :image, ImageUploader

	validates :프로젝트명, :소감, presence: true

end
