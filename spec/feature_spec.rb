feature 'Bookmark viewing' do
  before :each do
    trunc_test_database
  end
  scenario 'show all bookmarks' do
    populate_test_database
    visit '/bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.bing.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end

feature 'Add Bookmark' do
  before :each do
    trunc_test_database
  end
  scenario 'input new bookmark' do
    populate_test_database
    visit '/'
    click_button 'add_bookmark'
    fill_in :title, with: 'BBC'
    fill_in :url,  with: 'http://www.bbc.co.uk'
    click_button 'submit'
    expect(page).to have_content 'BBC'
  end
end
