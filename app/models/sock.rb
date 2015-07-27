class Sock < ActiveRecord::Base
  has_one :transaction
  mount_uploader :avatar, AvatarUploader
end
