require 'pg'
def setup_test_database
	connection = PG.connect(dbname: 'makersbnb_test')
	connection.exec("TRUNCATE TABLE users, spaces, requests;")
	connection.exec("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
	connection.exec("ALTER SEQUENCE spaces_id_seq RESTART WITH 1;")
end

