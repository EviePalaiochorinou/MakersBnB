require 'pg'
def setup_test_database
	connection = PG.connect(dbname: 'makersbnb_test')
	connection.exec("TRUNCATE users;")
end

def setup_test_database_spaces_table
  p 'truncating spaces table from test db'
	connection = PG.connect(dbname: 'makersbnb_test')
	connection.exec("TRUNCATE spaces;")
end