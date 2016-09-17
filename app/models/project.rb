class Project < ApplicationRecord
	belongs_to :user
	
	has_many :comments
	has_many :notices
	has_many :likes
	has_many :liked_users, through: :likes, source: :user
	has_many :project_users
	has_many :users, through: :project_users

	validates :프로젝트명, :일정, :목표, :시작일자, :종료일자, :인원, presence: true 

	mount_uploader :photo, PhotoUploader
end
