class RentMailer < ApplicationMailer
  def new_rent_created(rent)
    @user = rent.user
    @rent = rent
    @book = rent.book
    mail(to: @user.email, subject: 'New Rent was Created')
  end
end
