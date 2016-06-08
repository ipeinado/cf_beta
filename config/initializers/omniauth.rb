Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, Figaro.env.twitter_api_key, Figaro.env.twitter_api_secret, :image_size => 'original'
	provider :facebook, Figaro.env.FACEBOOK_KEY, Figaro.env.FACEBOOK_SECRET, 
		scope: 'email, public_profile', info_fields: 'id, bio, email, name, link, website', :image_size => 'large'
end