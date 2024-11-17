namespace :dev do
  desc "Setup development environment"
  task setup: :environment do
    puts("Reset the database...")
    %x(rails db:drop db:create db:migrate)

    puts "Creating contact types..."

    kinds = %w(Friend Commercial Unknown)
    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    puts "Creating contacts types..."

    100.times do |i|
      contact = Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: '1970-01-01', to: '2000-12-31').to_s,
        kind: Kind.all.sample
      )

      puts "Created contact #{contact.name} with ID #{contact.id}"

      Random.rand(1..5).times do
        phone = Phone.create!(
          number: Faker::PhoneNumber.cell_phone,
          contact: contact 
        )
        puts "Created phone #{phone.number} for contact ID #{contact.id}"
      end
    end

    puts "Contacts and Phones created!"


    #######################
    puts "Creating Address..."

    Contact.all.each do |contact|
      address = Address.create(
        street:Faker::Address.street_address,
        city:Faker::Address.city,
        contact: contact
      )
  end

  puts "Address created!"
    
  end


#########################



end
