def sign_up
    visit '/'
  fill_in 'email', with: 'johnsmith@email.com'
  fill_in 'password', with: 'johnsmith12345'
    fill_in 'username', with: 'JS'
  click_button 'Sign up'
end