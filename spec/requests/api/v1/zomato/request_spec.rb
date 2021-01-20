require 'rails_helper'

describe 'exposes GET /api/v1/foodie?start=denver,co&end=pueblo,co&search=italian' do
  it 'creates a road_trip and respondes with JSON' do

    headers = { 'CONTENT_TYPE' => 'application/json', 'user-key' => (ENV['ZOMATO_API_KEY'].to_s) }

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian', headers: headers

    expect(response).to be_successful

    foodie = JSON.parse(response.body, symbolize_names: true)

    expect(foodie[:data]).to be_a(Hash)
    expect(foodie[:data]).to have_key(:id)
    expect(foodie[:data][:attributes]).to have_key(:end_location)
    expect(foodie[:data][:attributes]).to have_key(:travel_time)
    expect(foodie[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(foodie[:data][:attributes][:restaurant]).to have_key(:address)
  end
end
