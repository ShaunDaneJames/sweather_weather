require 'rails_helper'

describe 'exposes POST /api/v1/sessions' do
  it 'finds a user to log in' do
    calvin = User.create!(email: 'Calvin@Hobbes.com',
                          password: 'EZPZ123',
                          password_confirmation: 'EZPZ123',
                          api_key: SecureRandom.uuid)
    user_data = {
      email: "Calvin@Hobbes.com",
      password: "EZPZ123"
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_data)

  end
end
