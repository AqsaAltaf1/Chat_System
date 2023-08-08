class User < ApplicationRecord
<<<<<<< HEAD
=======
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
>>>>>>> 9f2401c549ffac0406c4b0efd74b4e3e91dd8c4d
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:confirmable,
  :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
<<<<<<< HEAD
      user.full_name = auth.info.name
=======
      user.full_name = auth.info.name 
>>>>>>> 9f2401c549ffac0406c4b0efd74b4e3e91dd8c4d
      user.avatar_url = auth.info.image
    end
  end
end
