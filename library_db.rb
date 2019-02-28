require 'active_record'

ActiveRecord::Base.establish_connection(
                      :adapter => "sqlite3",
                      :database => "library_database"
)

# class to first drop the tables if they exist and then create the tables
class Clean < ActiveRecord::Migration[5.2]
  # creating tables
  def self.up
    ActiveRecord::Schema.define do
      create_table :users do |table|
        table.column :name, :string
        table.column :age, :integer
        table.column :books_borrowed, :integer
      end
      create_table :books do |table|
        table.column :user_id, :integer
        table.column :title, :string
        table.column :borrowed_when, :string
        table.column :due_back, :string
      end
    end
  end
  #dropping tables
  def self.down
    drop_table :users
    drop_table :books
  end
  # check if tables already exist and taking appropriate action
end

# creating associations
class User < ActiveRecord::Base
  has_many :books
end
class Book < ActiveRecord::Base
  belongs_to :user
end

if(User.table_exists? || Book.table_exists?)
  Clean.down
  Clean.up
else
  Clean.up
end

# Closure - lambda with 'call' to execute the code
# arguments : block code, parameter(number of books of each user)
# it has a price per book (encapsulation) used to calculate total price for each user
# number of arguments MUST match the number of parameters in method call
def price_lambda (block,no_of_books)
  price_per_book = 10
  block.call()
  puts price_per_book*no_of_books
end

#creating users and their books records
user = User.create(:name=>'Sahiba', :age=>25, :books_borrowed=>3)
user.books.create(:title=>'Book_1', :borrowed_when=>'2-Jan', :due_back=>'10-Jan')
user.books.create(:title=>'Book_2', :borrowed_when=>'1-Jan', :due_back=>'15-Jan')
user.books.create(:title=>'Book_3', :borrowed_when=>'10-Jan', :due_back=>'10-Feb')

user = User.create(:name=>"Yati", :age=>23, :books_borrowed=>1)
user.books.create(:title=>"Book_4", :borrowed_when=>"2-Jan", :due_back=>"20-Jan")

user = User.create(:name=>"Shreyans", :age=>26, :books_borrowed=>2)
user.books.create(:title=>"Book_5", :borrowed_when=>"25-Dec", :due_back=>"14-Jan")
user.books.create(:title=>"Book_6", :borrowed_when=>"4-Jan", :due_back=>"27-Jan")


puts "\nDetails of Book_4 : #{Book.find(4).inspect}"
puts "\nFirst user is : #{User.first.inspect}"
puts "\nDetails of books belonging to user 3 'Shreyans' : "
Book.where("user_id = 3").each{|book| p book}
puts "\nDetails of users who are 25 years old or more : "
User.where("age >= 25").each{|user| p user}

# use of closure - lambda
# print the price to be paid by user depending on number of books borrowed
# passes the whole block body as a variable in parameter
# number of arguments must match
User.all.each do |user|
  block = lambda {puts "\nPrice to be paid by user #{user.name} : "}
  no_of_books = user.books_borrowed
  price_lambda(block,no_of_books)
end


