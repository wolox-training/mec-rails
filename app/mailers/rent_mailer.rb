class RentMailer < ApplicationMailer
  def new_rent_created(rent)
    @user = rent.user
    @rent = rent
    @book = rent.book
    mail(to: @user.email, subject: I18n.t('email.new_rent.mail_header'))
  end
end
