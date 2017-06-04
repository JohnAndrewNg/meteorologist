Rails.application.routes.draw do

  get("/", { :controller => "geocoding", :action => "street_to_coords_form" })

  get("/street_to_coords/new", { :controller => "geocoding", :action => "street_to_coords_form" })
  get("/street_to_coords", { :controller => "geocoding", :action => "street_to_coords" })

  get("/coords_to_weather/new", { :controller => "forecast", :action => "coords_to_weather_form" })
  get("/coords_to_weather", { :controller => "forecast", :action => "coords_to_weather" })

  get("/street_to_weather/new", { :controller => "meteorologist", :action => "street_to_weather_form" })
  get("/street_to_weather", { :controller => "meteorologist", :action => "street_to_weather" })

  get("/street_to_restaurants/new", { :controller => "restaurants", :action => "street_to_restaurants_form" })
  get("/street_to_restaurants", { :controller => "restaurants", :action => "street_to_restaurants" })

get("/street_to_restaurants/bookmark", { :controller => "restaurants", :action => "bookmark"})
#get "/street_to_restaurants/bookmark", :controller => "restaurants", :action => "bookmark"

end
