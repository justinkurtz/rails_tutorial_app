namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    admin = User.create!(:name => "Justin Kurtz",
                 :email => "kurtz.justin@gmail.com",
                 :password => "pass",
                 :password_confirmation => "pass")
    admin.toggle!(:admin)
    require 'faker'
    Rake::Task['db:reset'].invoke
    99.times do |n|
      name = Faker::Name.name
      email = "example#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
