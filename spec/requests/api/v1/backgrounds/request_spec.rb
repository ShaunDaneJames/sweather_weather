require 'rails_helper'

describe 'exposes /api/v1/backgrounds?location=denver,co', type: :request do
  it 'accepts location as query params' do
    location = 'denver,co'
    get "/api/v1/backgrounds?location=#{location}"
  end
end 
