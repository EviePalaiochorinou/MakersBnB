feature 'sign-in' do
  scenario 'User should be able to sign in' do
   
		sign_up

    expect(current_path).to eq '/sessions/new'
		fill_in 'email', with: 'johnsmith@email.com'
    fill_in 'password', with: 'johnsmith12345'
		click_button "Sign in"

		expect(current_path).to eq '/space/listings'
  end   
end
