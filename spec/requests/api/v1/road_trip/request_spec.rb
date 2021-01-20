require 'rails_helper'

describe 'exposes POST /api/v1/road_trip' do
  it 'creates a road_trip and respondes with JSON' do
    user = User.create!(email: 'someone@example.com',
                        password: 'EZPZ123',
                        password_confirmation: 'EZPZ123',
                        api_key: 'b3083e4e-250f-490f-971f-f764f242fd71')
    road_trip_data =
    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "b3083e4e-250f-490f-971f-f764f242fd71"
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_data)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip[:data]).to be_a(Hash)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
    expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
    expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
    expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'renders an unauthorized message if presented with bad credentials' do
    user = User.create!(email: 'someone@example.com',
                        password: 'EZPZ123',
                        password_confirmation: 'EZPZ123',
                        api_key: 'b3083e4e-250f-490f-971f-f764f242fd71')
    road_trip_data =
    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": ""
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_data)

    expect(response.status).to eq(401)
  end
end
