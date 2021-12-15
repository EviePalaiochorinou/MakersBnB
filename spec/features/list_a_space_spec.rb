feature 'list a space' do
  scenario 'user should be able to list a space' do
    sign_up
    sign_in
    click_button 'List a Space'
    expect(current_path).to eq '/spaces/new'
    expect(page).to have_content('List a Space')
  end
end