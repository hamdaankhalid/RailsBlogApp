class OtpRemovalJob < ApplicationJob
  queue_as :default

  def perform(account)
    account.update(otp: nil)
  end
end
