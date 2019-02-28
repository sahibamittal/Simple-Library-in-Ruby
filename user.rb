class User
  attr_accessor :fname, :lname, :address, :userID, :age, :bookBorrowed

  def initialize (fname, lname, address, userID, age)
    @fname,@lname,@address,@userID,@age = fname,lname,address,userID,age
  end

end