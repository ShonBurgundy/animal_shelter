require 'rails_helper'

describe "post an animal route", :type => :request do
  
  before do
    post '/animals', params: { :species => 'dog', :name => 'batman' }
  end

  it 'returns the animals species' do
    expect(JSON.parse(response.body)['species']).to eq('dog')
  end

  it 'returns an animal name' do
    expect(JSON.parse(response.body)['name']).to eq('batman')
  end
end