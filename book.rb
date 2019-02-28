class Book
  attr_accessor :title, :author, :bookID, :edition, :status, :borrower

  def initialize(title,author,bookID,edition)
    @title,@author,@bookID,@edition,@status = title,author,bookID,edition,"available"
  end

end