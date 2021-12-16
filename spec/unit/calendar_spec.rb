require 'calendar'
require 'pg'

describe Calendar do
  it 'returns the day a space is available from' do
    # mock space (fake list a space) to not rely on Space class or DatabaseConnection class
    con = PG.connect(dbname: 'makersbnb_test')
    rs  = con.exec_params("INSERT INTO spaces (name, description, price_per_night, available_from, available_to)
          VALUES($1, $2, $3, $4, $5 )
          RETURNING id, name, description, price_per_night, available_from, available_to;",
          ['makers', 'fake office', 100, '12/04/2022','05/04/2022']
    )

    # fake_space = double(:name => 'makers', :description => 'fake office', :price_per_night => 100, :available_from => '16/04/2022', :available_to => '20/04/2022')
    
    # 1 populate our test dabase
    # 2 model should grab data from table + select availblre from
    # 3 model does logit stuff to get day

    # grab available_from from the table
    # extract the day from available_from
    # return the day 
    
    rs = con.exec("SELECT * FROM spaces")

    expect(Calendar.start_day).to eq 16
    

  end
end