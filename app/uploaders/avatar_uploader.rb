class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'fallback/' + [version_name, 'default_avatar.png'].compact.join('_')
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :post_showpage do
    process resize_to_fill: [40, 40]
  end

  version :feedpage do
    process resize_to_fill: [30, 30]
  end

  version :showpage do
    process resize_to_fill: [150, 150]
  end

  version :editpage do
    process resize_to_fill: [100, 100]
  end

  version :followed_user do
    process resize_to_fill: [38, 38]
  end

  def content_type_whitelist
    %r{image\/}
  end
end
