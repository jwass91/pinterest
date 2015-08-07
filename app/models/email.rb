class Email 
  
  def self.send_simple_message(email, username, key)
  RestClient.post "https://api:key-c75265d73687fc46ca0bdf558ee5b41a"\
  "@api.mailgun.net/v3/sandbox8bc08204b98243e5be44eb95bcbdb14e.mailgun.org/messages",
  :from => "Mailgun Sandbox <postmaster@sandbox8bc08204b98243e5be44eb95bcbdb14e.mailgun.org>",
  :to => email,
  :subject => "Hi #{username}, thanks for signing up. Verify your email for pintrest!",
    :text => "Hi #{username}. Please click this link to verify your email: #{key} "
end
  
  
end