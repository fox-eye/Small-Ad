ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "romano.lucas@gmail.com",
  :password             => "petmagik",
  :authentication       => "plain",
  :enable_starttls_auto => true
}