require './lib/bookmarks.rb'
require 'database_helper.rb'
require 'pg'

describe 'adding a bookmark' do
  it 'updates the database' do
    trunc_test_database
    Bookmark.add('www.bbc.co.uk')
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    result = con.exec "SELECT * FROM bookmarks where url = 'www.bbc.co.uk'"
    expect(result.values[0][1]).to eq('www.bbc.co.uk')
  end
end
