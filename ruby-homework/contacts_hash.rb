require 'securerandom'

class Contacts
  def initialize
    @contacts = {}
  end

  def add(contact)
    id = create_id
    @contacts[id] = contact
    id
  end

  def update(id, contact)
    if @contacts[id]
      @contacts[id] = contact
      true
    else
      false
    end
  end

  def delete(id)
    if @contacts[id]
      @contacts.delete(id)
      true
    else
      false
    end
  end

  def search_by_name(name)
    @contacts.values.find { |contact| contact.name == name }
  end

  def update_phone(id, phone)
    if @contacts[id] && (phone.match(/^\+380[\d]{9}$/))
      @contacts[id].phone = phone
      true
    else
      raise "invalid phone number: #{phone}"
    end
  end

  def sorted_list
    result = []
    @contacts.each do |id, contact|
      result.push(contact.name)
    end
    return result.sort
  end

  private

  def create_id
    SecureRandom.base64(5)
  end
end

class Contact
  attr_reader :name, :phone, :address
  attr_writer :phone

  def initialize(name, phone, address)
    if (phone.match(/^\+380[\d]{9}$/))
      @name = name
      @phone = phone
      @address = address
    else
      raise "invalid phone number: #{phone}"
    end
  end
end

contacts = Contacts.new
contact_1 = Contact.new("Maria", "+380938470983", "Kyrylivska St, 13Е, Kyiv, 04080")
puts contact_1
contact_2 = Contact.new("Vera", "+380657874565", "Khmel St, 1Е, Harkiv, 87840")
puts contact_2
contact_3 = Contact.new("Hello", "+380112345676", "World St., 5H, Harkiv, 98340")
puts contact_3
contact_4 = Contact.new("Nady", "+380859485673", "Street St., 7H, Harkiv, 927367")
puts contact_4
contact_5 = Contact.new("Aria", "+380638347483", "Street St., 7H, Harkiv, 927367")
puts contact_5
add_1_contact = contacts.add(contact_1)
puts add_1_contact
delete_2_contact = contacts.add(contact_2)
puts delete_2_contact
add_4_contact = contacts.add(contact_4)
puts add_4_contact
add_5_contact = contacts.add(contact_5)
puts add_5_contact
puts "Update:"
puts contacts.update(add_1_contact, contact_3)
puts contacts.update('b8b11f5fa7', contact_3)
puts "Delete:"
puts contacts.delete(delete_2_contact)
puts contacts.delete('b8b11f5fa7')
puts "Search name:"
puts contacts.search_by_name("Hello")
puts contacts.search_by_name("Nady")
puts contacts.search_by_name("Vera")
puts contacts.search_by_name("Aria")
puts "Sorted list:"
puts contacts.sorted_list
puts "Update phone:"
puts contacts.update_phone(add_4_contact, "+380756463636")
puts contacts.update_phone('add_4_contact', "12345")

