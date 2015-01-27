require 'httparty'
 
auth = {
  username: "75df33276084418f8882f59ba135cddd",
  password: "60ed78c6c060ee94"
}
 
@response = HTTParty.get("http://www.everytrail.com/api/index/search?q=yosemite", :basic_auth => auth)
 
p @response.inspect