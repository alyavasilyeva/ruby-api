require 'rails_helper'

shared_examples_for 'forbidden_requests' do
  let(:authorization_error) do
    {
      "status" => "403",
      "source" => { "pointer" => "/headers/authorization" },
      "title" =>  "Not authorized",
      "detail" => "You have no right to access this resource."
    }
  end
  
  it 'should return 403 status code' do
    subject
    expect(response).to have_http_status(:forbidden)
  end

  it 'should return proper error json' do
    subject
    expect(json['errors']).to include(authorization_error)
  end
end