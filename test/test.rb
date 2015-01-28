require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'libxml'
require 'pry'
 
auth = {
  username: "75df33276084418f8882f59ba135cddd",
  password: "60ed78c6c060ee94"
}
 
response = HTTParty.get("http://www.everytrail.com/api/index/search?q=austin", :basic_auth => auth)

binding.pry

get '/' do
	response
end