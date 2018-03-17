# Load the Rails application.
require_relative 'application'




# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :port           => ENV['25'],
  :address        => ENV['smtp.mailgun.org'],
  :user_name      => ENV['postmaster@sandbox4da2a91014c44e5d98bff970fa7a4f2f.mailgun.org'],
  :password       => ENV['e3ea952f3348d5ca5159f25469e3e895-833f99c3-ad7431dd'],
  :domain         => 'glacial-lake-54827.herokuapp.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
