require 'httparty'
require 'nokogiri'


class MainController < ApplicationController
  skip_before_action :authorize
  
  def index
      # authkeys for everytrail api
      auth = {
         username: "75df33276084418f8882f59ba135cddd",
         password: "60ed78c6c060ee94"
       }
      
      @user_ip = get_ip
      @coords = get_lat_lon(@user_ip)
      #queries everytrail api based on current location, gets xml string response
       @response = HTTParty.get("http://www.everytrail.com/api/index/search", :basic_auth => auth, :query => {:lat => @coords[:lat], :lon => @coords[:lon],
                      :proximity => 25, :limit => 10},
                      :format => :xml
                      )
       #parse xml string into an Nokogiri xml document
       doc = Nokogiri.XML(@response.body)
       #find the guides list in the search response
       @guides = doc.xpath('//guides')
  end

  #example search method (not working or linked to anything useful)
  def search
    search_query = params[:search]
    @response = HTTParty.get("http://www.everytrail.com/api/index/search", :basic_auth => auth, :query => {:q => search_query, :limit => 6},
                      :format => :xml
                      )
    doc = Nokogiri.XML(@response.body)
    @guides = doc.xpath('//guides')
  end


  def trail
  end

  private 

  #gets ip of client
  def get_ip
    #if client is local (running on localhost) then use a default IP address
    if request.remote_ip == "::1"
      return "108.28.24.45" #REPLACE WITH BETTER DEFAULT IP
    end
    return request.remote_ip
  end

  #use freegeoip.net API to get the lat lon associated with an IP address
  def get_lat_lon(ip)
    #gets JSON from site
    response = HTTParty.get("https://freegeoip.net/json/" + ip)
    return {:lat => response["latitude"], :lon => response["longitude"]}
  end

end
