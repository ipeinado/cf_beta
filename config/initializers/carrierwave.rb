CarrierWave.configure do |config|
  config.fog_credentials = {
<<<<<<< HEAD
    provider:              'AWS',  # required
    aws_access_key_id:     ENV["aws_access_key_id"], # required
    aws_secret_access_key: ENV["aws_secret_access_key"], # required
    region:                'eu-central-1'                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'cfbeta'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
=======
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],
    :region => 'eu-central-1'                         # required
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                     # required
>>>>>>> af0aef2e1fda7a4bb7bedfd3d4ada60577b22ff9
end
