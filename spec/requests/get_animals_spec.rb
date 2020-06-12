require 'rails_helper'
require 'pry'

# --------------- GET ALL TESTS ---------------

describe "get all animals route", :type => :request do 
  let!(:animals) { FactoryBot.create_list(:animal, 20)}

  before { get '/animals' }

  it 'returns all animals' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns status ok' do
    expect(response).to have_http_status(:ok)
  end

end

# --------------- GET by id TESTS ---------------

describe 'get animals by id', :type => :request do
  
  before do
    post '/animals', params: {:species => 'dog', :name => 'batman'}
    get '/animals', params: {:species => 'dog', :name => 'batman'}
  end

  it 'returns an animals specie' do
    response_to = Animal.last
    expect(response_to.species).to eq('dog')
  end

  it 'returns an animals name' do
    response_to = Animal.last
    expect(response_to.name).to eq('batman')
  end

  it 'returns 200 status ok' do
    response_to = Animal.last
    expect(response).to have_http_status(:ok)
  end

end

# --------------- ERROR MESSAGE TESTS ---------------

describe "GET request error messages", :type => :request do
  before { get '/animals/5000'}

  it 'returns an error message for unidentifiable animal' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Couldn't find Animal with 'id'=5000"})
  end

  it 'returns status 404' do
    expect(response).to have_http_status(:not_found)
  end

end