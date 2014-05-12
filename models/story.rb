require_relative '../lib/database'

class Story

  def self.format
    statement = ".mode line"
    Database.execute(statement)
  end
 
  def self.print_all
    statement =  "SELECT title, author FROM Stories;"
    stories = Database.execute(statement)
    stories.each_with_index do |row,i|
      print (i+1).to_s + " " + row[0].to_s + " by " + row[1].to_s + "\n"
    end
  end

  def self.find_story_by_id(input)
    statement = "SELECT title, story FROM Stories WHERE id = ?;"
    result = Database.execute(statement, input)
    puts ""
    puts result[0][0]
    puts ""
    puts result[0][1]
  end

  def self.print_genres
    @genre_array = []
    statement = "SELECT DISTINCT genre FROM Stories"
    genres = Database.execute(statement)
    genres.each_with_index do |row,i|
      print (i+1).to_s + " " + row[0].to_s + "\n"
      @genre_array << row
    end
  end

  def self.print_authors
    @author_array = []
    statement = "SELECT DISTINCT author FROM Stories"
    authors = Database.execute(statement)
    authors.each_with_index do |row,i|
      print (i+1).to_s + " " + row[0].to_s + "\n"
      @author_array << row
    end
  end

  def self.print_years
    @year_array = []
    statement = "SELECT DISTINCT year FROM Stories"
    years = Database.execute(statement)
    years.each_with_index do |row,i|
      print (i+1).to_s + " " + row[0].to_s + "\n"
      @year_array << row
    end
  end

  def self.find_stories_with_search(input, search_term)
    @stories = []
    index = input.to_i - 1

    if search_term == "genre"
      result = @genre_array[index]
    elsif search_term == "author"
      result = @author_array[index]
    elsif search_term == "year"
      result = @year_array[index]
    end
    statement = "SELECT title,author FROM Stories WHERE " + search_term + " = ?"
    stories = Database.execute(statement, result)
    stories.each_with_index do |row,i|
      print (i+1).to_s + " " + row[0].to_s + " by " + row[1].to_s + "\n"
      @stories << row
    end
  end

  def self.find_story(input)
    index = input.to_i - 1
    title = @stories[index][0]
    statement = "SELECT story FROM Stories WHERE title = ?"
    story = Database.execute(statement, title)
    puts "[" + title.to_s + "]"
    puts story
  end
  
end
