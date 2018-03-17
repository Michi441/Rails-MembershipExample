# Load the Rails application.
require_relative 'application'




# Initialize the Rails application.
Rails.application.initialize!


config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "glacial-lake-54827.herokuapp.com",
  :user_name => "postmaster@sandbox4da2a91014c44e5d98bff970fa7a4f2f.mailgun.org",
  :password => "e3ea952f3348d5ca5159f25469e3e895-833f99c3-ad7431dd"
}
