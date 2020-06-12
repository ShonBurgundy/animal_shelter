require 'rails_helper'


# --------------- PUT ROUTE TESTS ---------------

describe 'put route', :type => :request do
   
  before do
    post '/animals', params: { :species => 'dog', :name => 'batman' }
    animal_id = JSON.parse(response.body) ['id']
    put "/animals/#{animal_id}", params: { :species => 'dog', :name => 'robin' }
  end

  it 'updates an animal with new name' do
    expect(JSON.parse(response.body)).to eq({"message"=>"This animal has been updated successfully!"})
  end

  it 'returns status 200 ok when update is succesfull' do
    expect(response).to have_http_status(:ok)
  end
end

# --------------- PUT ROUTE ERROR TESTS ---------------

describe 'put route errors', :type => :request do

  before do
    put "/animals/5000", params: { :species => 'dog', :name => 'robin' }
  end

  it 'throws an error message if user does not specify existing animal' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Couldn't find Animal with 'id'=5000"})
  end

  it 'returns status 404 not found when update is unsuccessfull' do
    expect(response).to have_http_status(:not_found)
  end
end