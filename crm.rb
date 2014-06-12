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

#View a contacts
# get '/contacts/:id' do
# end

get "/contacts/1" do
	@contact = @@rolodex.find(1)
	erb :show_contact
end

# modify an existing ocntact
get '/contacts/:id/edit' do
end

#post request for submission form
post '/contacts' do
	puts params
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	@@rolodex.add_contact(new_contact)
	redirect('/contacts')
end
