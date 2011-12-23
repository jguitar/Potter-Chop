require 'mongo'

class Db_connection
  def initialize
    @conn = Mongo::Connection.new
    @conn.db(Db_connection.db_name)
  end
  
  def Db_connection.db_name
    "potterchop"
  end
end