require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	@contacts = []
  @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
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