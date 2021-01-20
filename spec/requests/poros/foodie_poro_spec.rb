require 'rails_helper'

describe  'FoodiePoro' do
  it 'has proper attribues' do
    start = 'denver'
    destination = 'pueblo'
    search = 'italian'

    poro = FoodieFacade.get_foodie_data(start, destination, search)
    expect(poro).to be_a FoodieRestaurantPoro
    expect(poro.end_location).to eq('Pueblo')
    expect(poro.travel_time).to eq('01 hrs 44 mins')
    expect(poro.forecast).to have_key(:temperature)
    expect(poro.restaurant).to eq({:name=>"Angelo's Pizza Parlor", :address=>"105 E Riverwalk, Pueblo 81003"})
  end
end
