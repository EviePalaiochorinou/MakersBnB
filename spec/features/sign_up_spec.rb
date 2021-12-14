feature 'sign-up' do
  scenario 'User should be able to sign in' do
    sign_up

    expect(page).to have_current_path('/sessions/new')
    expect(page).to have_content("Sign in")
    
  end   
end

