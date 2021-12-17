require 'booking_request'

describe BookingRequest do
	
	describe "create" do
		it 'creates a new booking_request' do
			user = User.create(email: 'test@test.com', password: '123', username: 'test')
			user_2 = User.create(email: 'test2@test.com', password: '123', username: 'test2')
			space = Space.create(name: 'loft', description: "beautiful", price_per_night: 100, available_from: '2021-12-19', available_to: '2021-12-21', user_id:"1")
			p space
			new_booking_request = BookingRequest.create(user_id: "1", space_id: "1", date: '2021-12-19')

			expect(new_booking_request).to be_a BookingRequest
			expect(new_booking_request.date).to eq space.available_from
		end
	end
end
