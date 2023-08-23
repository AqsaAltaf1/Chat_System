class User < ApplicationRecord
  validates :full_name, presence: true
  scope :all_except, ->(user) { where.not(id: user) }
  scope :online, ->{where("last_seen_at > ?", 30.seconds.ago)}
  after_create_commit { broadcast_append_to "users" }
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:confirmable,
  :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
