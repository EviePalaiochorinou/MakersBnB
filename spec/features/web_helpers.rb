def sign_up
	visit '/'
  fill_in 'email', with: 'johnsmith@email.com'
  fill_in 'password', with: 'johnsmith12345'
	fill_in 'username', with: 'JS'
  click_button 'Sign up'
end

def sign_in
  visit '/sessions/new'
  fill_in 'email', with: 'johnsmith@email.com'
  fill_in 'password', with: 'johnsmith12345'
  click_button "Sign in"
end

def list_a_space
  click_button('List a Space')
  fill_in('name', with: 'Makers Office')
  fill_in('description', with: 'a charming open space with exposed bricks')
  fill_in('price_per_night', with: '100')
  fill_in('available_from', with: '01-01-2022')
  fill_in('available_to', with: '06-01-2022')
  click_button('Submit')
end
