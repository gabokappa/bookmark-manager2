User story 1:
  As a user
  So I can browse the web easily
  I want to see a list of my bookmarks

User story 2:
  As a User
  so that I can come back to my favourite websites easily
  I want add to my bookmarks

User story 3:
  As a User
  so that I can keep my bookmarks tidy
  I want to delete bookmarks

  User story 4:
    As a User
    so that I can change my bookmarks
    I want to be able to update my bookmarks

Domain model for user story 1:
  Class                               Class
  List                                Bookmarks
  @bookmarks = []   <-stores--        tbd
  show()                              tbd

Database setup instructions:

Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql
In detail:

$psql
$CREATE DATABASE BOOKMARK;
$\c bookmark
$bookmark=# CREATE TABLE bookmarks(
bookmark(# id SERIAL PRIMARY KEY,
bookmark(# url VARCHAR(60)
bookmark(# );

To confirm table created:
bookmark=# \d+ bookmarks
                                                       Table "public.bookmarks"
 Column |         Type          | Collation | Nullable |                Default                | Storage  | Stats target | Description
--------+-----------------------+-----------+----------+---------------------------------------+----------+--------------+-------------
 id     | integer               |           | not null | nextval('bookmarks_id_seq'::regclass) | plain    |              |
 url    | character varying(60) |           |          |                                       | extended |              |
Indexes:
    "bookmarks_pkey" PRIMARY KEY, btree (id)

*****End of database setup*****

## Observation

##Ex12

In Exercise 11, there needs to be a method override and a new html element.

You setup a feature test to delete the bookmark: feature 'Delete bookmark' do
```
  scenario 'remove bookmark from list' do
    trunc_test_database
    populate_test_database
    visit '/bookmarks'
    expect(page).to have_link(href: 'http://www.google.com')
    first('.bookmark').click_button 'Delete'
    expect(page).to have_no_link(href: 'http://www.google.com')
  end
end
```
The section:
```
first('.bookmark').click_button 'Delete'
```

In order to be able to tell capybara to click on the first 'Delete' button under the bookmark list you need to add a class and id to the html so that capybara can find it.

Here is the HTML for it

```
<ul>
  <% @bookmarks.each do |bookmark| %>
  <li class="bookmark" id="bookmark"-<%= bookmark.id %>">
    <a href ="<%= bookmark.url%>" target="_blank">
      <%=bookmark.title %>
    </a>
    <form action="/bookmarks/<%=bookmark.id%>" method="post">
      <input type='hidden' name='_method' value='delete'/>
      <input type='submit' value='Delete'/>
    <!-- <button type='submit' name='Delete' value="<%= bookmark.title%>">delete</button> -->
    </form>
  </li>
  <% end %>
</ul>

```

This is the line that you need to include(also with the bookmark.id so that you can pass the id value to the next section) The class allows you to manipulate the button in the test.

```
<li class="bookmark" id="bookmark"-<%= bookmark.id %>">
```
