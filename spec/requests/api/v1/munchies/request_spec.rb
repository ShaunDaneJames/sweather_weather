require 'rails_helper'

describe 'exposes GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese' do
  it 'creates a user and respondes with JSON' do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
require "pry"; binding.pry
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:id)
    expect(data[:id]).to be_an(Integer)
  end
end
