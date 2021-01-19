require 'rails_helper'

describe 'exposes GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese' do
  it 'creates a user and respondes with JSON' do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
  end

  
end
