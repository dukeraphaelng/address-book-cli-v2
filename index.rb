# frozen_string_literal: true

require_relative('AddressController.rb')
controller = AddressBookController.new

controller.welcome

loop do
  puts 'What would you like to do?'
  puts '1 - View all contacts'
  puts '2 - View a single contact'
  puts '3 - Create a new contact'
  puts '4 - Edit a contact'
  puts '5 - Delete a contact'
  puts '6 - Exit'

  choice = gets.chomp.to_i

  case choice
  when 1
    controller.view_all
  when 2
    controller.view_single
  when 3
    controller.create
  when 4
    controller.update
  when 5
    controller.delete
  when 6
    break
  else
    puts 'Please pick a valid choice'
  end
end

puts 'Goodbye'
