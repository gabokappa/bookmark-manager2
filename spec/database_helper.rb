def trunc_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec 'TRUNCATE bookmarks'
end

def populate_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com')"
  con.exec "INSERT INTO bookmarks (title, url) VALUES('Bing', 'http://www.bing.com')"
  con.exec "INSERT INTO bookmarks (title, url) VALUES('Destroy', 'http://www.destroyallsoftware.com')"
end
