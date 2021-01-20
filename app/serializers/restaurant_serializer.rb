class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  set_type :munchie

  attributes :destination_city, :travel_time, :forecast, :restaurant
end
