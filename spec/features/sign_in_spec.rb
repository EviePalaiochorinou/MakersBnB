feature 'sign-in' do
  scenario 'User should be able to sign in' do
   
		sign_up

    sign_in

		expect(current_path).to eq '/space/listings'
  end   
end
