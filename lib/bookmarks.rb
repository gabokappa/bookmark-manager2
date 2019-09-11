# comment
require 'pg'
class Bookmark
  attr_reader :name

  def self.all
    open_db_connection
    rs = @con.exec "SELECT * FROM bookmarks"
    p rs.map { |bookmark| bookmark['url'] + bookmark['title'] }
  end

  def self.add(new_title, new_url)
    open_db_connection
    @con.exec "INSERT INTO bookmarks (title, url) VALUES ('#{new_title}', '#{new_url}')"
  end

private

  def self.open_db_connection
    if ENV['ENVIRONMENT'] == 'test' then
      @con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
  end

end
