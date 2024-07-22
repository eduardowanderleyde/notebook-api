namespace :dev do
  desc "Setup development environment"
  task setup: :environment do

    puts "Contacts created!"

    puts "Creating contact types..."

    kinds = %w(Friend Commercial Unknown)
    kinds.each do |kind|
      Kind.create!( 
        description: kind
      )
    end


    puts "Creating contacts types..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: '1970-01-01', to: '2000-12-31').to_s,
        kind: Kind.all.sample
      )
    end 
    
    puts "Contacts created!"
  end
end
