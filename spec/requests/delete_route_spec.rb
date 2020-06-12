require 'rails_helper'
require 'pry'

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