feature 'List A Space' do
  scenario 'a owner can list a space' do
    sign_up
    sign_in
    click_button('List a Space')
    # visit '/spaces'
    fill_in('name', with: 'Makers Office')
    fill_in('description', with: 'a charming open space with exposed bricks')
    fill_in('price_per_night', with: '100')
    fill_in('available_from', with: '01-01-2022')
    fill_in('available_to', with: '06-01-2022')
    click_button('Submit')

    expect(page).to have_content('Makers Office')
    expect(page).to have_content('a charming open space with exposed bricks')
    expect(page).to have_content('100')
    # TODO: check available format?
  end
end