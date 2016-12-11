# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  # user_name:  ENV['SENDGRID_USERNAME'],
  # password:  ENV['SENDGRID_PASSWORD'],
  user_name: 'app60529991@heroku.com',
  password: 'ssttcx0s3473',
  domain:  'asfourconsulting.com',
  address:  'smtp.sendgrid.net',
  port:  587,
  authentication:  :plain,
  enable_starttls_auto:  true
}
