require 'pg'
require_relative 'database_connection'

class User
    attr_reader :id, :email, :password, :username
	def initialize(id:, email:, password:, username:)
		@id = id
		@email = email
		@password = password
		@username = username
	end

  def self.create(email:, password:, username: )
		
		result = DatabaseConnection.query(
			"INSERT INTO users (email, password, username) VALUES($1, $2, $3) RETURNING id, email, password, username;",
			[email, password, username]
		)


		User.new(
			id: result[0]['id'],
			email: result[0]['email'],
			password: result[0]['password'],
			username: result[0]['username']
		)

  end
end



