require 'rails_helper'
require 'pry'

# --------------- DELETE ROUTE TESTS ---------------

describe 'delete route', :type => :request do
  
  before do
    post '/animals', params: { :species => 'dog', :name => 'batman' }
    animal_id = JSON.parse(response.body) ['id']
    delete "/animals/#{animal_id}"
  end

  it 'deletes an animal' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Animal successfully deleted!"})
  end

  it 'returns status 200 ok when delete is successfull' do
    expect(response).to have_http_status(:ok)
  end
end

# --------------- DELETE ROUTE ERROR TESTS ---------------

describe 'delete route errors' , :type => :request do

  before do
    delete "/animals/5000"
  end

  it 'throws an error message if user does not specify existing animal' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Couldn't find Animal with 'id'=5000"})
  end

  it 'returns status 404 not found when delete is unsuccessfull' do
    expect(response).to have_http_status(:not_found)
  end
end

# --------------- DELETE ROUTE 422 ERROR TESTS ---------------

describe "post route 422 error", :type => :request do
  
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