feature 'Offering available dates for a space' do
    scenario 'client can book from available dates' do
      # sign_up
      # sign_in
      
      # list_a_space
      visit '/spaces/1'
      expect(page).to have_content('Pick a night')
      expect(page).to have_content('Makers Office')
      #expect(page).to have_button('Request to Book')
    end
end