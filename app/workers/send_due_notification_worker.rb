require 'sidekiq-scheduler'
class SendDueNotificationWorker
  include Sidekiq::Worker

  def perform
    due_rents = Rent.where('rents.end < :now', now: Time.zone.now)
    due_rents.each do |rent|
      DueRentMailer.due_rent_notify(rent.id).deliver_later
    end
  end
end
