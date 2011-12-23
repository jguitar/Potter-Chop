require './src/db_connection'

describe "Database connections specs" do
  before(:each) do
    @conn = Db_connection.new
  end
  
  it "should connects to potterchop when we connect" do
    db_name = Db_connection.db_name
    db_name.should eql "potterchop"
  end
end