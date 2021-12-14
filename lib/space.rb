require 'database_connection'

class Space

    attr_reader :id, :name, :description, :price_per_night, :available_from, :available_to

    def initialize(id:, name:, description:, price_per_night:, available_from:, available_to:)
        @id = id
        @name = name
        @description = description
        @price_per_night = price_per_night
        @available_from = available_from
        @available_to = available_to
    end

    def self.create(name:, description:, price_per_night:, available_from:, available_to:)
        result = DatabaseConnection.query(
          "INSERT INTO spaces (name, description, price_per_night, available_from, available_to) VALUES($1, $2 , $3, $4, $5)
          RETURNING id, name, description, price_per_night, available_from, available_to;",
          [name, description, price_per_night, available_from, available_to])

          # result = [{id: 'id', name: 'name', description: 'description', price_per_night: 'price_per_night'}]

        Space.new(
          id: result[0]['id'],
          name: result[0]['name'],
          description: result[0]['description'],
          price_per_night: result[0]['price_per_night'],
          available_from: result[0]['available_from'],
          available_to: result[0]['available_to']
          )
        
          # Space.new(name: "Makers office", description: "a charming open plan space in E London", price_per_night: 100, available_from: "01-01-2022", available_to: "06-01-2022")
    end
end