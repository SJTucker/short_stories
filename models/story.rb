#require_relative '../lib/environment'

class Story
  attr_accessor :title

  def initialize(title, genre, author, year, story)
    @title = title
    @genre = genre
    @author = author
    @year = year
    @story = story
  end
  
  def self.find_all
    statement = "SELECT * FROM Short Stories;"
    execute_and_instantiate(statement)
  end

  def self.find_titles
    statement = "SELECT title FROM Short Stories;"
    execute_and_instantiate(statement)
  end

  def self.execute_and_instantiate(statement, bind_vars = [])
    #rows = Environment.database_connection("../short_story_db.sqlite").execute(statement, bind_vars)
    rows = Environment.database_connection.execute(statement, bind_vars)
    results = []
    rows.each do |row|
      story = Story.new(row["title"], row["genre"], row["author"], row["year"], row["story"])
      results << story
    end
    results
  end
end
