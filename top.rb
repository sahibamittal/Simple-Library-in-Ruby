require_relative 'book'
require_relative 'user'
require_relative 'library'

book1 = Book.new("Title1","Author1",1,"edition-1")
book2 = Book.new("Title2","Author2",2,"edition-2")
book3 = Book.new("Title3","Author3",3,"edition-3")
book4 = Book.new("Title4","Author4",4,"edition-4")
book5 = Book.new("Title5","Author5",5,"edition-5")

user1 = User.new("Aanchal","Gupta","address-1","userID-1",25)
user2 = User.new("Ravina","Gulati","address-2","userID-2",22)
user3 = User.new("Yati","Jain","address-3","userID-3",30)


mainLibrary = Library.new()
mainLibrary.addBooks([book1,book2,book3,book4,book5])
mainLibrary.addUsers([user1,user2,user3])
mainLibrary.showLibrary
mainLibrary.borrow(5,"userID-2")
mainLibrary.showLibrary
mainLibrary.borrow(5,"userID-3")
mainLibrary.showLibrary

