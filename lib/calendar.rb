require 'pg'

class Calendar

  attr_reader :id, :start_day, :end_day
  
  def initialize(id:, start_day:, end_day:)
    @id = id
    @start_day = start_day
    @end_day = end_day
  end

  def self.availability(id:) #in controller    id: params[space_id] to select the right row of data 
    result = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE id = $1;",
      [id]
    )
    p result

# available_from: 'YYYY/MM/DD'

    Calendar.new(
			id: result[0]['id'], 
			start_day: (Date.parse(result[0]['available_from'])).strftime("%m/%d/%Y"),
      end_day: (Date.parse(result['available_to'])).strftime("%m/%d/%Y")
    )
  end

  # 16...20 +> hightlighted

  # def self.start_day(id:) #in controller    id: params[space_id] to select the right row of data 
  #   # fake_space = double(:name => 'makers', :description => 'fake office', :price_per_night => 100, :available_from => '16/04/2022', :available_to => '20/04/2022')

  #   result = DatabaseConnection.query(
  #     "SELECT available_from FROM spaces WHERE id = $1;",
  #     [space_id]
  #   )
  #   p result

  #   Calendar.new(
	# 		id: result[0]['id'], 
	# 		available_from: result[0]['available_from']
  #   )
  #     # result = [{available_from: '16/04/2022'}]
  #   result.map do |data|
  #     (Time.parse(data['available_from'])).strftime("%m/%d/%Y")
  #   end
  # end
end