def trunc_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec 'TRUNCATE bookmarks'
end

def populate_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "INSERT INTO bookmarks (url) VALUES('http://www.google.com')"
  con.exec "INSERT INTO bookmarks (url) VALUES('http://www.bing.com')"
  con.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"
end
