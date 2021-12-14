require 'space'

describe Space do
  describe '#create' do
    it 'creates a new space' do
	    space_1 = Space.create(name: 'Makers Office', description: 'a charming open plan space in E London', price_per_night: '£100', available_from: '01/01/2022', available_to: '06/01/2022')

      expect(space_1).to be_a Space
      expect(space_1.description).to eq 'a charming open plan space in E London'
    end  
  end
end