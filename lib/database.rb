require "sqlite3"

class Database < SQLite3::Database
  def initialize
  end


  def self.execute(statement, bind_vars = [])
    db = SQLite3::Database.open "short_story_db.sqlite"
    db.execute(statement, bind_vars)

  end
end
