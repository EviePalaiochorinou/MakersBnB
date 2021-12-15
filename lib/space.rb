require 'database_connection'

class Space

    attr_reader :id, :name, :description, :price_per_night, :available_from, :available_to

    def initialize(id:, name:, description:, price_per_night:, available_from:, available_to:)
        @id = id          # we decide to have the id just in case we need to display the spaces in a descending order
        @name = name
        @description = description
        @price_per_night = price_per_night
        @available_from = available_from
        @available_to = available_to
    end

    # def self.all # a method that returns all the spaces listed in the database as a new array

      # 1) result = connect to db and use sql query to select all the rows !!!
        # we get an array contain hashes? (1 hash/item per row?)
        # use Time parse + strftime to format our dat if we want (simplest solution?)

      # 2) we .map our result : wrap each data entry into a Space instance

    # end

    def self.all
        result = DatabaseConnection.query(
            "SELECT * FROM spaces (name, description, price_per_night) VALUES ($1"
        )
    end

    def self.create(name:, description:, price_per_night:, available_from:, available_to:)
        result = DatabaseConnection.query(
          "INSERT INTO spaces (name, description, price_per_night, available_from, available_to) VALUES($1, $2 , $3, $4, $5)
          RETURNING id, name, description, price_per_night, available_from, available_to;",
          [name, description, price_per_night, available_from, available_to])

        # result = [{id: '1', name: 'Makers office', description: 'a charming open plan space in E London', price_per_night: '100', available_from: '01-01-2022', available_to: '06-01-2022'}]

        # wrapping the result of our sql query into a Space instance (ruby object)
        # the array only contains 1 hash => index stays at 0
        # we 'match' the keywords from the #initialize method (parameters)
        # to the values we get from the result hash (once we do result[0] we are in the array and select from the hash itself)

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