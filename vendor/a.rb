require 'bcrypt'
#登録画面
signup_password = BCrypt::Password.create("my")
puts signup_password

#ログイン画面
login_password = BCrypt::Password.new(signup_password)
if login_password == 'my' #params[:pass]
    puts "OK"
end