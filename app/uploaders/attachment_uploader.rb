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
    process encode_video: [:mp4, resolution: "200x200"]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :thumb, if: :image? do
    process resize_to_fit: [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

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
