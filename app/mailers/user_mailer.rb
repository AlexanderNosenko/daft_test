class UserMailer < ApplicationMailer

  def registration(user_id)
    @user = User.find(user_id)

    mail(to: @user.email, subject: 'Welcome ' + @user.name + '!')
  end

end
