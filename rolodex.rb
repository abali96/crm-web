class Rolodex
	attr_reader :contacts

	def initialize
		@contacts = []
		@id = 1
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def find(x)
		@contacts.find { |contact| contact.id == x }
	end

	def remove_contact(contact)
		@contacts.delete(contact)
	end

end
