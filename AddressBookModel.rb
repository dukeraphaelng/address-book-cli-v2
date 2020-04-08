# frozen_string_literal: true

class Contact
  attr_accessor :id, :creation_time, :update_time, :last_viewed,
                :name, :categories, :numbers, :emails, :address,
                :birthday, :note, :extrafields

  def initialize
    @id = id # random_id_gem
    @creation_time = time # current_time
    @update_time = time # update_time
    @last_viewed = time # last_viewed
    @name = ContactName.new
    @categories = []
    @numbers = []
    @emails = []
    @address = ContactAddress.new
    @birthday = ContactBirthday.new
    @note = ContactNote.new
    @extrafields = []
  end
end

class ContactName
  attr_accessor :full_name, :first_name, :middle_name, :last_name, :nickname

  # Default Fields
  def initialize(first_name, middle_name, last_name, nick_name)
    @full_name = @first_name + @middle_name + @last_name
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @nick_name = nick_name
  end

  # Additional Customizable Fields
end

class ContactCategory
  attr_accessor :category

  def initialize
    @category = category
  end
end

class ContactNumber
  attr_accessor :number_type, :digits

  def initialize(number_type, digits)
    @number_type = number_type
    @digits = digits
  end
end

class ContactEmail
  attr_accessor :email_type, :address

  def initialize(email_type, address)
    @email_type = email_type
    @address = address
  end
end

class ContactAddress
  attr_accessor :full_address, :street, :town, :county, :postcode, :country

  def initialize(street, town, county, postcode, country)
    @full_address = @street + ', ' + @town + ', ' + @county + ', ' + @postcode + ', ' + @country
    @street = street
    @town = town
    @county = county
    @postcode = postcode
    @country = country
  end
end

class ContactBirthday
  attr_accessor :date

  def initialize(date)
    @date = date
  end
end

class ContactNote
  attr_accessor :characters

  def initialize(characters)
    @characters = characters
  end
end

class ContactExtraField
  attr_accessor :field, :text

  def initialize(field, text)
    @field = field
    @text = text
  end
end

class AddressBookModel
  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def empty
    @contact.empty?
  end

  def find; end

  def view_all; end

  def view_single; end

  def create(new_contact_details)
    new_contact = Contact.new
    new_contact.name.first_name = new_contact_details['general']['first_name']
    new_contact.name.middle_name = new_contact_details['general']['middle_name']
    new_contact.name.last_name = new_contact_details['general']['last_name']
    new_contact.name.nick_name = new_contact_details['general']['nick_name']
    @contacts.push(new_contact)
  end

  def update; end

  def delete; end
end
