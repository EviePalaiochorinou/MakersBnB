feature 'request a space' do
    scenario 'user can request a space' do
		sign_up
    sign_in
    expect(current_path).to eq '/spaces'
    click_button 'Requests'
    expect(current_path).to eq '/requests'
    expect(page).to have_content('Requests')
    end
end