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
