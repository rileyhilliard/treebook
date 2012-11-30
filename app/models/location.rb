class Location < ActiveRecord::Base
  attr_accessible :address, :ip_address, :latitude, :longitude, :city, :country
  has_many :users
  require 'geocoder'
  geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.country = geo.country_code
    end
  end
  after_validation :geocode, :reverse_geocode
  
  def ip_address
    user_ip = JSON.parse(open("http://jsonip.com/").read)
    parsed_ip = user_ip["ip"]
    "#{parsed_ip}"
  end
  
  def geo_ip
    request.ip
  end
  
end
