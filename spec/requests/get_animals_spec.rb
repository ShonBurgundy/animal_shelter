require 'rails_helper'
require 'pry'

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

describe "GET request error messages", :type => :request do
  before { get '/animals/5000'}

  it 'returns an error message for unidentifiable animal' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Couldn't find Animal with 'id'=5000"})
  end

end