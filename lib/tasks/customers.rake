namespace :customers do
  desc "Create Notification for in progress orders"
  task :notify_orders => [ :environment ] do
    Order.in_progress.each do |order|
      Notification.create!()
    end
  end

end
