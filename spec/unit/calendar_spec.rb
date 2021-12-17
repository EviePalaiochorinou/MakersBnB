require 'calendar'
require 'pg'

describe Calendar do
  it 'returns a space availability' do
    # mock space (fake list a space) to not rely on Space class or DatabaseConnection class
    con = PG.connect(dbname: 'makersbnb_test')
    rs  = con.exec_params("INSERT INTO spaces (name, description, price_per_night, available_from, available_to)
          VALUES($1, $2, $3, $4, $5 )
          RETURNING id, name, description, price_per_night, available_from, available_to;",
          ['makers', 'fake office', 100, '12/04/2022','05/04/2022']
    ) 

    result_id = con.exec("SELECT id FROM spaces;")
    space_id = result_id.map {|data| data['id'].to_i } # id: data['id'],
    space_id[0]
    # Calendar.availabilty(id: @space.id)
    Calendar.availability(id: space_id[0])
    # Calendar.availability(id: session[space_id])
    
    p Calendar.start_day
    p Calendar.end_day
    # expect(Calendar.start_day).to eq 12
    # expect(Calendar.end_day).to eq 5
    # fake_space = double(:name => 'makers', :description => 'fake office', :price_per_night => 100, :available_from => '16/04/2022', :available_to => '20/04/2022')
    
    # 1 populate our test dabase
    # 2 model should grab data from table + select availblre from
    # 3 model does logit stuff to get day

    # grab available_from from the table
    # extract the day from available_from
    # return the day

    # expect(Calendar.start_day).to eq 16
  end
end