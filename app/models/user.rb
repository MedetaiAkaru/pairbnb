class User < ActiveRecord::Base
  include Clearance::User
  has_many :listings
  has_many :reservations
  has_many :payments

  mount_uploader :avatar, AvatarUploader
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

def has_payment_info?
  braintree_customer_id
end


  def password_optional?
    true
  end

  def largeimage
  "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end
   def normalimage
  "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end
  def smallimage
  "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end
 end