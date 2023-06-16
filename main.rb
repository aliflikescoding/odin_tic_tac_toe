puts 'plese input the name of the first user'
name_user1 = gets.chomp
puts 'plese input the name of the second user'
name_user2 = gets.chomp

# the user class
class User
  attr_accessor :name, :pick, :win

  def initialize(name)
    @name = name
    @pick = [[0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]]
    @win = false
  end

  # method to choose the space
  def choose_space
    puts 'please enter your row number'
    puts 'please enter a number between 1 and 3'
    num_row = gets.chomp.to_i
    num_row -= 1
    puts 'please enter your column number'
    puts 'please enter a number between 1 and 3'
    num_col = gets.chomp.to_i
    num_col -= 1

    # puts "#{num_col} #{num_row}"
    pick[num_row][num_col] = 1
  end

  def to_s
    puts "user class with the name of #{@name}"
  end
end

# to play the game call this method
def play_game(user1, user2)
  
end

user1 = User.new(name_user1)
user2 = User.new(name_user2)
