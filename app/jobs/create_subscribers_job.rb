class CreateSubscribersJob < ActiveJob::Base
  queue_as :default

  def perform(list)
    list.create_subscribers
  end
end
