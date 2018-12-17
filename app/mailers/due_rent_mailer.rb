class DueRentMailer < ApplicationMailer
  def due_rent_notify(rent_id)
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book
    mail(to: @user.email, subject: 'Due rent Notify')
  end
end
