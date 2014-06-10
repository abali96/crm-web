class Rolodex
	attr_reader :contact_book

	def initialize
		@contact_book = []
		@contact_id = 1
	end

	def add_contact(contact)
		contact.id = contact_id
		@contact_book << contact
		@contact_id += 1
	end
end
