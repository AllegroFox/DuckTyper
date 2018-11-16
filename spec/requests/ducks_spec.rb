require 'rails_helper'

RSpec.describe 'Ducks API', type: :request do
	# initialize test data
	let!(:owners) { create_list(:owner, 5) }
	let!(:colours) { create_list(:colour, 8) }
	let!(:markings) { create_list(:marking, 6) }
	let!(:ducks) { create_list(:duck, 10) }

	let(:duck_id) { ducks.first.id }

	# Tests for GET /ducks
	describe 'GET /ducks' do
		# make HTTP get request before each example
		before { get '/ducks' }

		it 'returns ducks' do
			# NOTE: 'json' is a custom helper to parse JSON responses
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end
		
		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end		

	# Tests for POST /ducks
	describe 'POST /ducks' do
		#valid post data
    context 'when the request is valid' do
    	before { post '/ducks', params: { name: 'Steve', 
																				colour_id: 4,
    																		marking_id: 3,
    																		owner_id: 2 } }

    	it 'creates a duck' do
    		expect(json['name']).to eq('Steve')
    	end
    	
    	it 'returns status code 201' do
    		expect(response).to have_http_status(201)
    	end
    end

    context 'when the request is invalid' do
    	before { post '/ducks', params: { name: 'Foobar' }}

    	it 'returns status code 422' do
    		expect(response).to have_http_status(422)
    	end
    	
    	it 'returns a validation failure message' do
    		expect(response.body).to match(/Validation failed:/)
    	end
    end
  end  																			

	# Tests for GET /ducks/:id
	describe 'GET /ducks/:id' do
		before { get "/ducks/#{duck_id}" }

		context 'when the record exists' do
			it 'returns the duck' do
				expect(json).not_to be_empty
				expect(json['id']).to eq(duck_id)
			end
			
			it 'returns status code 200' do	
				expect(response).to have_http_status(200)
			end	
		end
		
		context 'when the record does not exist' do
			let(:duck_id) { 100 }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end
			
			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find Duck/)
			end
		end
	end						


	# Tests for PUT /ducks/:id
	describe 'PUT /ducks/:id' do
		let(:valid_attributes) {{ name: 'Bobert' }}

		context 'when the record exists' do
			before { put "/ducks/#{duck_id}", params: valid_attributes }

			it 'updates the record' do
				expect(response.body).to be_empty
			end
			
			it 'returns status code 204' do
				expect(response).to have_http_status(204)
			end
		end
	end				

	# Tests for DELETE /ducks/:id
	describe 'DELETE /ducks/:id' do
		before { delete "/ducks/#{duck_id}" }

		it 'returns status code 204' do
			expect(response).to have_http_status(204)
		end
	end		
	
end