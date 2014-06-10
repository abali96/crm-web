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