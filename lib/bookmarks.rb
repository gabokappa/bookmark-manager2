# comment
require 'pg'
class Bookmark
  attr_reader :name

  def self.all
    open_db_connection
    rs = @con.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| bookmark['url'] }
  end

  def self.add(new_url)
    open_db_connection
    @con.exec "INSERT INTO bookmarks (url) VALUES ('#{new_url}')"
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
