require 'space'

describe Space do
  describe '#create' do
    it 'creates a new space' do
      user = User.create(email: 'test1@gmail.com', password: '123', username: 'test')
	    space_1 = Space.create(name: 'Makers Office', description: 'a charming open plan space in E London', price_per_night: 100, available_from: '01/01/2022', available_to: '06/01/2022', user_id: 1)
      expect(space_1).to be_a Space
      expect(space_1.description).to eq 'a charming open plan space in E London'
      expect(space_1.name).to eq 'Makers Office'
    end  
  end

  describe '#all' do
    it 'shows all the listed spaces' do
      user = User.create(email: 'test1@gmail.com', password: '123', username: 'test')
      Space.create(name: 'Makers Mansion', description: 'a charming mansion in E London', price_per_night: 400, available_from: '01/01/2022', available_to: '06/01/2022', user_id: 1)
      all_spaces = Space.all

      expect(all_spaces.length).to eq 1
      expect(all_spaces.first.name).to eq 'Makers Mansion'
      expect(all_spaces.first.price_per_night).to eq 400
      expect(all_spaces.first.available_to).to eq '06/01/2022'
    end
  end
end