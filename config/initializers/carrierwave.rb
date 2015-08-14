CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],
    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],
    :region                 => 'ap-southeast-2'
  }
  config.fog_directory  = ENV["AWS_BUCKET"]
end
