require 'database_connection'

describe DatabaseConnection do
	
	context "#setup" do
		it 'setting up a connection to a local DB with the help of PG' do
			expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
			DatabaseConnection.setup("makersbnb_test")
		end
	end

	context "#query" do
		it 'executes an SQL query via PG object' do
			connection = DatabaseConnection.setup('makersbnb_test')
			expect(connection).to receive(:exec_params).with("SELECT * FROM users;", [])
			DatabaseConnection.query("SELECT * FROM users;")
		end
	end

end