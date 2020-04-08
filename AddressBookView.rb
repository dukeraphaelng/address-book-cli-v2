# frozen_string_literal: true

def ask(prompt)
  puts prompt
  input = gets.chomp
  input
end

def ask_proto(prompt)
  puts prompt
  input = gets
  input
end

class AddressBookView
  def welcome
    puts 'Welcome to Address Book CLI v2 - MVC'
  end

  def view_all(contacts)
    puts "\n"

    if contacts.empty?
      puts "There is currently no item\n\n"
    else
      puts "CONTACT LIST:"
      contacts.each do |contact|
        puts contact.name.full_name
      end
    end
  end

  def view_single(contact)
    puts "\n"
    puts "Name: #{contact.name.full_name}"
    puts "Nickname: #{contact.name.nickname}" if(contact.name.nickname)
    puts "Categories: "
    contact.categories.each_with_index do |category, index|
      if index < contact.categories.length - 1
        print category + ', '
      else
        print category + '.'
    end
    puts "Numbers: " if (contact.numbers)
    contact.numbers.each do |number|
      puts "#{number.number_type} - #{number.digits}"
    end
    puts "Emails: " if (contact.emails)
    contact.emails.each do |email|
      puts "#{email.email_type} - #{email.address}"
    end
    puts "Address: #{contact.address.full_address}"
    puts "Birthday: #{contact.birthday.date}"
    puts "Note: #{contact.note.characters}"
    if (contact.extrafields)
      contact.extrafields.each do |extrafield|
        puts "#{extrafield.field}: #{extrafield.text}"
      end
    end
  end

  def create
    puts "\n"
    puts 'Creating a new contact...'
    first_name = ask('First name: ')
    middle_name = ask('Middle name: ')
    last_name = ask('Last name: ')
    nick_name = ask('Nickname: ')
    category = ask('Categories: ') #split(', ') in Model
    puts 'Numbers: '

    number_array = []
    digits = true
    while (!digits)
      digits = ask('Number: ')
      number_type = ask('Type: ')
      number_array.push({
        'digits' => digits,
        'number_type' => number_type
      })
    end

    email_array = []
    address = true
    while (!address)
      address = ask('Email: ')
      email_type = ask('Type: ')
      email_array.push({
        'address' => address,
        'email_type' => email_type
      })
    end

    puts "Address: "
    street = ask('Street: ')
    town = ask('Town: ')
    county = ask('County: ')
    postcode = ask('Postcode: ')
    country = ask('Country: ')
    birthday = ask('Birthday: ')
    note = ask('Note: ')

    field_array = []
    field = true
    while (!field)
      field = ask('New Field: ')
      text = ask('New Text: ')
      field_array.push({
        'field' => field,
        'text' => text
      })
    end

    general = {
      'first_name' => first_name,
      'middle_name' => middle_name,
      'last_name' => last_name,
      'nick_name' => nick_name,
      'category' => category,
      'street' => street,
      'town' => town,
      'county' => county,
      'postcode' => postcode,
      'country' => country,
      'birthday' => birthday,
      'note' => note}

    return {
      'general' => general, 
      'number_array' => number_array, 
      'email_array' => email_array, 
      'field_array' => field_array}
  end

  def missing(id)
    puts "Contact with id #{id} does not exist."
  end

  def update
    id = ask('Please enter the ID of the contact you wish to update')
    view_single(contact)
    option = ask('Would you like to update all fields or one field')
  end

  def update_all
    # repeat method in create
  end

  def update_single
    #loop starts
      field = ask('Which field would you like to update')
    #loop ends
  end

  def delete; end
end