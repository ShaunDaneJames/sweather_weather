require 'rails_helper'

describe 'it can connect to Zomato' do
  it 'returns a restaurant' do
    search = 'italian'
    destination = 'pueblo'
    destination_coordinates = LocationFacade.get_coordinates(destination)

    restaurant = FoodieService.get_restaurant(search, destination_coordinates)

    expect(restaurant).to be_a(Hash)
    expect(restaurant[:restaurant][:cuisines]).to include("Italian")
  end
end
