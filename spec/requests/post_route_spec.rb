require 'rails_helper'

# --------------- POST ROUTE TESTS ---------------

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

  it 'returns a 201 created status' do
    expect(response).to have_http_status(:created)
  end
end

# --------------- POST ROUTE ERROR TESTS ---------------

describe "post route errors", :type => :request do
  
  before do
    post '/animals', params: { :species => nil, :name => nil }
  end

  it "returns error message when params are not included in request" do
    expect(JSON.parse(response.body)).to eq({"message"=>"Validation failed: Species can't be blank, Name can't be blank"})
  end

  it "returns status 422 Unprocessable Entity" do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end