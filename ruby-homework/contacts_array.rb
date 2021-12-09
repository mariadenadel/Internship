class Contacts
  def initialize
    @contacts = []
  end

  def create(name, phone, address)
    new_contact = { name: name, phone: phone, address: address }
    @contacts.push(new_contact)
    @contacts.length - 1
  end

  def list
    @contacts
  end

  def update(id, name, phone, address)
    if @contacts[id]
      @contacts[id] = { name: name, phone: phone, address: address }
      true
    else
      false
    end
  end

  def delete(id)
    if @contacts[id]
      @contacts.delete_at(id)
      true
    else
      false
    end
  end

  def search_by_id(id)
    @contacts[id]
  end

  def search_by_name(name)
    @contacts.find { |contact| contact[:name] == name }
  end
end

contacts = Contacts.new
puts "Add 1 contact"
puts contacts.create("Maria", 1234567, "Kyrylivska St, 13Е, Kyiv, 04080")
puts '=================================================================================='
puts "Add 2 contact"
puts contacts.create("Daria", 34789567, "Akademika Filatova St, 10А, Harkiv, 01042")
puts '=================================================================================='
puts "Add 3 contact"
puts contacts.create("Vera", 12933567, "Filatova St, 10А, Kyiv, 67573")
puts '=================================================================================='
puts "List of all contacts: "
puts contacts.list
puts '=================================================================================='
puts "Update first contact: "
puts contacts.update(1, "Sasha", 7464997, "Akademika Filatova St, 7А, Sofia, 01042")
puts '=================================================================================='
puts "List of all contacts: "
puts contacts.list
puts '=================================================================================='
puts "Update index 10"
puts contacts.update(10, "Sasha", 7464997, "Akademika Filatova St, 7А, Sofia, 01042")
puts '=================================================================================='
puts "List of all contacts: "
puts contacts.list
puts '=================================================================================='
puts "Delete second contact: "
puts contacts.delete(2)
puts '=================================================================================='
puts "List of all contacts: "
puts contacts.list
puts '=================================================================================='
puts "Delete 12 contact "
puts contacts.delete(12)
puts '=================================================================================='
puts "List of all contacts: "
puts contacts.list
puts '=================================================================================='
puts "Contact 1: "
puts contacts.search_by_id(1)
puts "Contact 2: "
puts contacts.search_by_id(2)
puts "Contact 0: "
puts contacts.search_by_id(0)
puts '=================================================================================='
puts "Contact nil: "
puts contacts.search_by_name("Vera")
puts "Contact Maria: "
puts contacts.search_by_name("Maria")
puts "Contact Daria: "
puts contacts.search_by_name("Daria")
puts "Contact nil: "
puts contacts.search_by_name("Dasha")
puts '=================================================================================='