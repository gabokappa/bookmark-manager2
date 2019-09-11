# comment
require 'pg'
class Bookmark
  attr_reader :id, :url, :title

  def initialize (id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end


  def self.all
    open_db_connection
    rs = @con.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])}
  end

  def self.add(new_title, new_url)
    open_db_connection
    result = @con.exec("INSERT INTO bookmarks (title, url) VALUES ('#{new_title}', '#{new_url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def self.delete(id)
    open_db_connection
    rs = @con.exec "DELETE FROM bookmarks WHERE id = '#{id}'"
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
