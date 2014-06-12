require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new("jonny", "appleseed", "jonny@bitmakerlabs.com", "generic character"))


get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

#Add a new contacts
get '/contacts/new' do
	erb :new_contact
end

# View a contact (generalized with wildcard)
get '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
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
	# puts params
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	@@rolodex.add_contact(new_contact)
	redirect('/contacts')
end

put 'contacts/:id' do
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

delete "/contracts/:id" do
	@contract = @@rolodex.find(params[:id].to_i)
	if @contact
		@@rolodex.remove_contact(@contact)
		redirect to ("/contracts")
	else
		raise Sinatra::NotFound
	end		
end

