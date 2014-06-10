require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new


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
get '/contacts/:id' do
end

#modify an existing ocntact
get '/contacts/:id/edit' do
end

#post request for submission form
post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	@@rolodex.add_contact(new_contact)
	redirect('/contacts')
end
