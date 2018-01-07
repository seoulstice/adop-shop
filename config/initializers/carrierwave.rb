
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = "adop-shop-app"
    config.aws_acl    = :public_read
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
          :access_key_id          =>  ENV["AWS_ACCESS_KEY_ID"],
          :secret_access_key      =>  ENV["AWS_SECRET_ACCESS_KEY"],
          :region                     =>  ENV["AWS_REGION"],
    }
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
