puts 'plese input the name of the first user'
name_user1 = gets.chomp
puts 'plese input the name of the second user'
name_user2 = gets.chomp

# the user class
class User
  def initialize(name)
    @name = name
    @pick = [[0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]]
  end

  def to_s
    puts "user class with the name of #{@name}"
  end
end

user1 = User.new(name_user1)
user2 = User.new(name_user2)
