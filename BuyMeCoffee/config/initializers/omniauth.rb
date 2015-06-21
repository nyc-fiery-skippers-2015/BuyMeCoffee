Rails.application.config.middleware.use OmniAuth::Builder do

  provider :linkedin, ENV['77mq4feex7uxw7'], ENV['CVF1DvzYJA8b7E77'],
  scope: 'r_basicprofile'

end