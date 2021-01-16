require 'rails_helper'

describe 'exposes /api/v1/forecast?location=denver,co', type: :request do
  it 'accepts location as query params' do
    location = 'denver,co'
    get "/api/v1/forecast?location=#{location}"
  end
end
