Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 'hR4DZVhjfQ3XWGB0CrYim47X1', 'Rgg4nS3DdBBLBKbOihxxhpnJLEzzYty8899ADLNxghe6Zixpah', :image_size => 'original'
	# provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
end