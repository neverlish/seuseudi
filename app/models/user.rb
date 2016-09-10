class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :likes
  has_many :liked_projects, through: :likes, source: :project
  has_many :project_users
  has_many :projects, through: :project_users, source: :user

  def is_like?(project)
  	Like.find_by(user_id: self.id, project_id: project.id).present?
  end
end
