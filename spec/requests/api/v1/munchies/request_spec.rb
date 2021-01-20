require 'rails_helper'

describe 'exposes GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese' do
  xit 'creates a user and respondes with JSON' do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
    list = JSON.parse(response.body, symbolize_names: true)
    expect(list[:data].first).to have_key(:id)
    expect(list[:data].first).to have_key(:type)
    expect(list[:data].first[:type]).to eq('munchie')
    expect(list[:data].first).to have_key(:attributes)
    expect(list[:data].first[:attributes]).to be_an(Hash)
    expect(list[:data].first[:attributes]).to have_key(:destination_city)
    expect(list[:data].first[:attributes][:destination_city]).to be_a(String)
    expect(list[:data].first[:attributes]).to have_key(:travel_time)
    expect(list[:data].first[:attributes][:travel_time]).to be_a(Float)
  end
end
