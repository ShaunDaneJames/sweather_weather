require 'rails_helper'

describe 'exposes /api/v1/forecast?location=denver,co', type: :request do
  it 'produces JSON in the proper format' do
    location = 'denver,co'
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    location_data = JSON.parse(response.body, symbolize_names: true)

    expect(location_data[:data]).to have_key(:id)
    expect(location_data[:data][:attributes]).to have_key(:current_weather)
    expect(location_data[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(location_data[:data][:attributes]).to have_key(:daily_weather)
    expect(location_data[:data][:attributes][:daily_weather].count).to eq(5)
    expect(location_data[:data][:attributes]).to have_key(:hourly_weather)
    expect(location_data[:data][:attributes][:hourly_weather].count).to eq(8)
  end
end
