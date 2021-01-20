require 'rails_helper'

describe 'Zomato service can call out to API' do
  it 'gets back a foodierestaurantporo' do
    start = 'denver'
    destination = 'pueblo'
    search = 'italian'

    poro = FoodieFacade.get_foodie_data(start, destination, search)

    expect(poro).to be_a FoodieRestaurantPoro
  end
end
