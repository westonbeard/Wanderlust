require 'httparty'
require 'nokogiri'


class MainController < ApplicationController
  skip_before_action :authorize
  
  def index

      auth = {
         username: "75df33276084418f8882f59ba135cddd",
         password: "60ed78c6c060ee94"
       }
       
      @user_ip = get_ip
      @coords = get_lat_lon(@user_ip)

       @response = HTTParty.get("http://www.everytrail.com/api/index/search", :basic_auth => auth, 
           :query => {:lat => @coords[:lat], :lon => @coords[:lon],
                      :proximity => 25, :limit => 10},
                      :format => :xml
                      )
       doc = Nokogiri.XML(@response.body)
       @guides = doc.xpath('//guides')
       #data = @response.parsed_response
       #@guides = data["etIndexSearchResponse"]["guides"]
      

  end

  def trail
  end

  private 

  def get_ip
    if request.remote_ip == "::1"
      return "108.28.24.45"
    end
    return request.remote_ip
  end

  def get_lat_lon(ip)
    response = HTTParty.get("https://freegeoip.net/json/" + ip)
    return {:lat => response["latitude"], :lon => response["longitude"]}
  end

end
