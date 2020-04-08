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
  attr_accessor :first_name, :middle_name, :last_name, :nickname

  # Default Fields
  def initialize(first_name, middle_name, last_name, nick_name)
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
  attr_accessor :type, :number

  def initialize(type, number)
    @type = type
    @number = number
  end
end

class ContactEmail
  attr_accessor :type, :email

  def initialize(type, email)
    @type = type
    @email = email
  end
end

class ContactAddress
  attr_accessor :street, :town, :county, :postcode, :country

  def initialize(street, town, county, postcode, country)
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
  attr_accessor :note

  def initialize(note)
    @note = note
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

  def find; end

  def view_all; end

  def view_single; end

  def create(contact); end

  def update; end

  def delete; end
end
