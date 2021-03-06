require 'open-uri'

class RestaurantsController < ApplicationController
  def street_to_restaurants_form
    # Nothing to do here.
    render("restaurants/street_to_restaurants_form.html.erb")
  end

  def street_to_restaurants
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================

    url = "http://maps.googleapis.com/maps/api/geocode/json?address="+@street_address
    parsed_data = JSON.parse(open(url).read)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


    @lat = @latitude.to_s
    @lng = @longitude.to_s


    url_restaurants = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+@lat+","+@lng+"&radius=500&type=restaurant&key=AIzaSyAuo4_mSeoT40F-4QAP8uyTvCdw8c7cbvU"

    parsed_data = JSON.parse(open(url_restaurants).read)
    @results = parsed_data["results"]


#    @restaurant_name = []
#    @price_level = []
#    @rating = []
#    @rough_address = []

#    parsed_data["results"].each do |result|
#      @restaurant_name.push(result["name"])
#      @price_level.push(result["price_level"])
#      @rating.push(result["rating"])
#      @rough_address.push(result["vicinity"])
#    end

#    @address_lat = []
#    @address_lng = []
#    parsed_data["results"].each do |result|
#      @address_lat.push(result["geometry"]["location"]["lat"])
#      @address_lng.push(result["geometry"]["location"]["lng"])
#    end


    render("restaurants/street_to_restaurants.html.erb")
  end


  def bookmark

    @name = params[:name]
    @price_level = params[:price_level]
    @rating = params[:rating]
    @photo_reference = params[:photo_reference]
    @placeid = params[:placeid]
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+@photo_reference+"&key=AIzaSyAuo4_mSeoT40F-4QAP8uyTvCdw8c7cbvU"

    url_details =
    "https://maps.googleapis.com/maps/api/place/details/json?placeid="+@placeid+"&key= AIzaSyAuo4_mSeoT40F-4QAP8uyTvCdw8c7cbvU"

    parsed_data = JSON.parse(open(url_details).read)

    @address = parsed_data["result"]["formatted_address"]
    @phone_number = parsed_data["result"]["formatted_phone_number"]
    @zipcode = parsed_data["result"]["address_components"][7]["long_name"]
    @opening_hours = parsed_data["result"]["opening_hours"]["weekday_text"]
    @url = parsed_data["result"]["website"]


    render("restaurants/bookmark.html.erb")
  end


end
