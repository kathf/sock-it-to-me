class Sock < ActiveRecord::Base
  has_one :order
  has_one :user, through: :orders
  mount_uploader :avatar, AvatarUploader

end
