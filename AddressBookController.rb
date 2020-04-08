# frozen_string_literal: true

require_relative('AddressBookView.rb')
require_relative('AddressBookModel.rb')

class AddressBookController
  def initialize
    @view = AddressBookView.new
    @model = AddressBookModel.new
  end

  def welcome
    @view.welcome
  end

  def view_all; end

  def view_single; end

  def create
    new_contact_details = @view.create
    new_contact = @model.create(new_contact_details)
  end

  def update; end

  def update_all; end

  def update_single; end

  def delete; end
end
