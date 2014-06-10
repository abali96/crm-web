require 'sinatra'
require_relative 'contact'

get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

#Add a new contacts
get '/contacts/new' do
end

#View a contacts
get '/contacts/:id' do
end

#modify an existing ocntact
get '/contacts/:id/edit' do
end