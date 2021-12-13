feature 'sign-up' do
  scenario 'User should be able to sign in' do
    visit '/'
    fill_in 'email', with: 'johnsmith@email.com'
    fill_in 'password', with: 'johnsmith12345'
    fill_in 'username', with: 'JS'
    click_button 'Submit'
  end   
end
