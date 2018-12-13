class RentMailer < ApplicationMailer
  def new_rent_created(rent_id)
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book
    mail(to: @user.email, subject: 'New Rent was Created')
  end
end
