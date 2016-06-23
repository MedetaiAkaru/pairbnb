class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	searchkick
	mount_uploader :picture, PictureUploader
end
