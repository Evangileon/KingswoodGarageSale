namespace :kingswood do

  desc "Create a default admin user"
  task create_default_user: :environment do
    User.create(:email_address => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Default', :last_name => 'Admin')
    puts
    puts "    New user has been created successfully."
    puts
    puts "    E-Mail Address..: admin@example.com"
    puts "    Password........: password"
    puts
  end

  task :setup => :environment do
    Rake::Task["kingswood:create_default_user"].invoke if User.all.empty?
  end

end
