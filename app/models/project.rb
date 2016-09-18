class Project < ApplicationRecord
	belongs_to :user
	
	has_many :comments, dependent: :destroy
	has_many :notices, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user, dependent: :destroy
	has_many :project_users, dependent: :destroy
	has_many :users, through: :project_users, dependent: :destroy
	has_many :results, dependent: :destroy

	validates :프로젝트명, :일정, :목표, :시작일자, :종료일자, :인원, presence: true 

	mount_uploader :photo, PhotoUploader
end
