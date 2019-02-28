require_relative 'book'
require_relative 'user'

class Library
  @@totalBooks = 0
  @@totalUsers = 0
  @@books = []
  @@users = []

  def addBooks(book)
    book.each do |b|
      @@books << b
      @@totalBooks += 1
    end
  end

  def addUsers(user)
    user.each do |u|
      @@users << u
      @@totalUsers += 1
    end
  end

  def self.books
    @@books
  end
  def self.users
    @@users
  end

  def totalBooks
    @@totalBooks
  end

  def totalUsers
    @@totalUsers
  end

  def showLibrary
    puts "\nTotal number of books in Library : #{@@totalBooks}"
    @@books.each {|book| puts book.inspect}
    puts "\nTotal number of users in Library : #{@@totalUsers}"
    @@users.each {|user| puts user.inspect}
  end

=begin
    Method borrow will carry out the borrowing of book with unique book_id by user with unique user_id
    It will display the details of borrowed book and its borrower every time this event takes place
    It will also update the specific book an user in library
=end

  def borrow(book_id, user_id)
    @@books.each do |book|
      @@users.each do |user|
        if book.bookID == book_id && user.userID == user_id
          if book.status == "available"
            book.borrower = (user.fname+" "+user.lname)
            book.status = "borrowed"
            user.bookBorrowed = book.title
            puts("\nFollowing user has borrowed the following book: ")
            puts("User : #{user.inspect}")
            puts("Book : #{book.inspect}")
          else
            puts "\nSorry! the selected book #{book.bookID} is currently not available and cannot be lend to #{user.userID}; \nbecause it is borrowed by user : #{book.borrower}" end
        end
      end
    end
  end

end
