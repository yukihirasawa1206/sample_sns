Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUDINARY_NAME"]
  config.api_key = ENV["CLONDINARY_API_KEY"]
  config.api_secret = ENV["CLOUDINARY_API_SECRET"]
  config.cdn_subdomain = true
end



