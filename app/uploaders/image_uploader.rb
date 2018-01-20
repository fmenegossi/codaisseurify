# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
	include Cloudinary::CarrierWave

	version :thumbnail do
    eager
    resize_to_fit(300, 300)
    cloudinary_transformation :quality => 70
  end
end
