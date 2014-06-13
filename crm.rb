require 'sinatra'
require 'data_mapper' #even though the gem is written in one word...annoying

DataMapper.setup(:default, "sqlite3:database.sqlite3") #creating a file for your database | before the colon, it's saying "we're using sqlite3"

class Contact
	include DataMapper::Resource 

	property :id, Serial #serial represents an integer that automatically increments
	property :first_name, String
	property :last_name, String
	property :email, String
	property :note, String
end

DataMapper.finalize
DataMapper.upgrade!

@@rolodex = Rolodex.new
# FAKE DATA:
# @@rolodex.add_contact(Contact.new("jonny", "appleseed", "jonny@bitmakerlabs.com", "generic character"))


get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

#Add a new contact
get '/contacts/new' do
	erb :new_contact
end

# View a contact (generalized with wildcard)
get '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	#make a variable of @contact associated with the contact of the ID :id in the rolodex
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

# Specific contact
# get "/contacts/1" do
# 	@contact = @@rolodex.find(1)
# 	erb :show_contact
# end

# modify an existing contact
get '/contacts/:id/edit' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

#post request for submission form
post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	@@rolodex.add_contact(new_contact)
	redirect to ('/contacts')
end

put '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]

		redirect to("/contacts")
	else 
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@@rolodex.remove_contact(@contact)
		redirect to ("/contacts")
	else
		raise Sinatra::NotFound
	end		
end