require 'space'

describe Space do
  describe '#create' do
    it 'creates a new space' do
	    space_1 = Space.create(name: 'Makers Office', description: 'a charming open plan space in E London', price_per_night: 100, available_from: '01/01/2022', available_to: '06/01/2022')

      expect(space_1).to be_a Space
      expect(space_1.description).to eq 'a charming open plan space in E London'
      expect(space_1.name).to eq 'Makers Office'
      # expect(space_1.available_from).to eq '01/01/2022'
    end  
  end

  describe '#all' do
    it 'shows all the listed spaces' do
        Space.create(name: 'Makers Mansion', description: 'a charming mansion in E London', price_per_night: 400, available_from: '01/01/2022', available_to: '06/01/2022')
        Space.create(name: 'Makers Apartment', description: 'a charming apartment in E London', price_per_night: 200, available_from: '04/01/2022', available_to: '03/04/2022')
        Space.create(name: 'Makers Cupboard Room', description: 'a charming cupboard room in E London', price_per_night: 100, available_from: '07/08/2022', available_to: '05/09/2022')
        all_spaces = Space.all

        expect(all_spaces.length).to eq 3
        expect(all_spaces.first.name).to eq 'Makers Mansion'
        expect(all_spaces.last.price_per_night).to eq 100
        expect(all_spaces.last.available_from).to eq '07/08/2022'
        expect(all_spaces.first.available_to).to eq '06/01/2022'
    end
  end
end