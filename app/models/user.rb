class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_projects, through: :likes, source: :project, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :joined_projects, through: :project_users, source: :project, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :thumbsups, dependent: :destroy
  has_many :thumbsup_results, through: :thumbsups, source: :result, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader

  def is_like?(project)
  	Like.find_by(user_id: self.id, project_id: project.id).present?
  end

  def is_thumbsup?(result)
    Thumbsup.find_by(user_id: self.id, result_id: result.id).present?
  end

  def self.find_for_facebook_oauth(auth)
    user = where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # 9assuming the user model has an image
    end
  end
 
   def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

end
