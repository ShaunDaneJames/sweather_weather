require 'rails_helper'

describe 'exposes POST /api/v1/users' do
  it 'creates a user and respondes with JSON' do
    user_data = {
      email: "Calvin@Hobbes.com",
      password: "EZPZ123",
      password_confirmation: "EZPZ123"
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_data)

    expect(User.last.email).to eq(user_data[:email])
  end
end
