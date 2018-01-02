class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer

  storage :file

  process :save_content_type_in_model

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :video, if: :video? do
    process encode_video: [:mp4, resolution: '200x200']
  end

  version :thumb, if: :image? do
    process resize_to_fit: [100, 100]
  end

  def content_type_whitelist
    %r{((image\/)|(video\/))}
  end

  protected

  def image?(file)
    file.content_type.start_with? 'image'
  end

  def video?(file)
    file.content_type.start_with? 'video'
  end

  def save_content_type_in_model
    model.content_type = file.content_type if file.content_type
  end
end
