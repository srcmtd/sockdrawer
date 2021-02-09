require "sequel/core"

# initialize Sequel and have it reuse Active Record's database connection
DB = Sequel.connect("postgresql://", extensions: :activerecord_connection)
