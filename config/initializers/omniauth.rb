Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '736856663056372', 'c37ffdbc6d955ba5abb8f5cc5d2f4df5',
<<<<<<< HEAD
            :scope => 'email,user_birthday,read_stream', :display => 'popup'
=======
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
>>>>>>> refs/remotes/origin/master
end