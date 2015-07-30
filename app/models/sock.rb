class Sock < ActiveRecord::Base
  has_one :order
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

end
