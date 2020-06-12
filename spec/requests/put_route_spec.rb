require 'rails_helper'

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