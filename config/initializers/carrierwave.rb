# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:              'AWS',                        # required
#     aws_access_key_id:     'DONGAAKIAYHQQCFOAOJOXAOGW',                        # required unless using use_iam_profile
#     aws_secret_access_key: 'MiTfKFuT1lCbsCrJx54dlX3ZRsi0qnOagqrsVsrBMQh',                        # required unless using use_iam_profile
#     use_iam_profile:       true,                         # optional, defaults to false
#     region:                'us-east-1',                  # optional, defaults to 'us-east-1'
#     host:                  'bien02.s3.us-east-1.amazonaws.com',             # optional, defaults to nil
#     endpoint:              'https://bien02.s3.us-east-1.amazonaws.com/' # optional, defaults to nil
#   }
#   config.fog_directory  = 'bien02'                                      # required
#   # config.fog_public     = false     : "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
#   # For an application which utilizes multiple servers but does not need caches persisted across requests,
#   # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
#   # config.cache_storage = :file
# end

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'bien02'
  config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_credentials = {
    access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    region:            ENV.fetch('AWS_REGION') # Required
  }
end