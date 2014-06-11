class Rolodex
	attr_reader :contacts

	def initialize(name)
		@contacts = []
		@contact_id = 1
		@name = name
	end

	def add_contact(contact)
		contact.id = @contact_id
		@contacts << contact
		@contact_id += 1
	end

end
