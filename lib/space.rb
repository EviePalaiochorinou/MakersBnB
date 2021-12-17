require_relative './database_connection'
require 'pg'

class Space

  attr_reader :id, :name, :description, :price_per_night, :available_from, :available_to, :user_id

    def initialize(id:, name:, description:, price_per_night:, available_from:, available_to:, user_id: )
        @id = id          # we decide to have the id just in case we need to display the spaces in a descending order
        @name = name
        @description = description
        @price_per_night = price_per_night
        @available_from = available_from
        @available_to = available_to
        @user_id = user_id
    end

    def self.all
        result = DatabaseConnection.query(
            "SELECT * FROM spaces;")
            
        result.map do |data|
          Space.new(
            id: data['id'],
            name: data['name'],
            description: data['description'],
            price_per_night: data['price_per_night'].to_i,
            available_from: (Time.parse(data['available_from'])).strftime("%m/%d/%Y"),   # display the "wrong" way but stays the same in db
            available_to: (Time.parse(data['available_to'])).strftime("%m/%d/%Y"),    
            user_id: data['user_id']   
            )
        end
    end

    # parse string form db then use strftime to format it
    # available_to: data['available_to'] => returns "2022-06-01" (american format)

    def self.create(name:, description:, price_per_night:, available_from:, available_to:, user_id:)
        result = DatabaseConnection.query(
          "INSERT INTO spaces (name, description, price_per_night, available_from, available_to, user_id) VALUES($1, $2, $3, $4, $5, $6) RETURNING id, name, description, price_per_night, available_from, available_to, user_id;",
          [name, description, price_per_night, available_from, available_to, user_id.to_i])

        Space.new(
          id: result[0]['id'],
          name: result[0]['name'],
          description: result[0]['description'],
          price_per_night: result[0]['price_per_night'],
          available_from: result[0]['available_from'],
          available_to: result[0]['available_to'],
          user_id: result[0]['user_id']
          )
        end

    def self.find(id:)
		return nil unless id
		
		result = DatabaseConnection.query(
			"SELECT * FROM spaces WHERE id = $1",
			[id]
		)
		Space.new(
			id: result[0]['id'], 
      name: result[0]['name'],
      description: result[0]['description'],
      price_per_night: result[0]['price_per_night'],
			available_from: result[0]['available_from'],
			available_to: result[0]['available_to']
		)
	end
    end