class Space

    attr_reader :name, :description, :price_per_night, :available_from, :available_to

    def initialize(name:, description:, price_per_night:, available_from:, available_to:)
        @name = name
        @description = description
        @price_per_night = price_per_night
        @available_from = available_from
        @available_to = available_to
    end

    def self.create(name:, description:, price_per_night:, available_from:, available_to:)
        Space.new(name: "Makers office", description: "a charming open plan space in E London", price_per_night: "£100", available_from: "01/01/2022", available_to: "06/01/2022")
    end
end