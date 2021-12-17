require 'pg'
require_relative './database_connection'

class BookingRequest

	attr_reader :id, :user_id, :space_id, :date, :approved

  def initialize(id:, user_id:, space_id:, date:, approved:)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @date = date
    @approved = approved
  end
	
	def self.create(user_id:, space_id:, date:)
		result = DatabaseConnection.query(
			"INSERT INTO requests(user_id, space_id, date)
			VALUES($1, $2, $3) RETURNING id, user_id, space_id, date, approved;",
			[user_id, space_id, date]
		)
		
		BookingRequest.new(
			id: result[0]['id'],
			user_id: result[0]['user_id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      approved: result[0]['approved']
		)

	end

end