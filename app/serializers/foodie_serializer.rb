class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  set_type :foodie

  attributes :end_location, :travel_time, :forecast, :restaurant
end
