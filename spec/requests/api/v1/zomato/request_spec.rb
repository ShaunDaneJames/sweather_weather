require 'rails_helper'

describe 'exposes GET /api/v1/foodie?start=denver,co&end=pueblo,co&search=italian' do
  it 'creates a road_trip and respondes with JSON' do

    headers = { 'CONTENT_TYPE' => 'application/json', 'user-key' => (ENV['ZOMATO_API_KEY'].to_s) }

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian', headers: headers

    expect(response).to be_successful
  end
end
