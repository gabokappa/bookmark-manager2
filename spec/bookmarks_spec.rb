require './lib/bookmarks.rb'
require 'database_helper.rb'
require 'pg'

describe 'adding a bookmark' do
  it 'updates the database' do
    trunc_test_database
    Bookmark.add('BBC','www.bbc.co.uk')
    con = PG.connect(dbname: 'bookmark_manager_test')
    result = con.exec "SELECT * FROM bookmarks where url = 'www.bbc.co.uk'"
    expect(result.values[0][1]).to eq('www.bbc.co.uk')
  end
end

describe '#all' do
  it 'displays all the bookmarks' do
    trunc_test_database
    con = PG.connect(dbname: 'bookmark_manager_test')
    bookmark = Bookmark.add('Makers Academy', 'http://www.makersacademy.com')
    persisted_data = persisted_data(id: bookmark.id)

    Bookmark.add('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.add('Google', 'http://www.google.com')

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

  end
end

describe '#delete' do
  it 'deletes a bookmark' do
    trunc_test_database
    con = PG.connect(dbname: 'bookmark_manager_test')
    bookmark = Bookmark.add('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.add('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.add('Google', 'http://www.google.com')
    bookmarks = Bookmark.all
    expect(bookmarks.length).to eq 3
    Bookmark.delete(bookmark.id)
    bookmarks = Bookmark.all
    expect(bookmarks.length).to eq 2
  end
end
