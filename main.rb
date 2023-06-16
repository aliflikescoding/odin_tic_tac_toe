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
end

# method to get number between 1 and 3
def prompt(name)
  puts "please enter your #{name} number"
  loop do
    puts 'enter a number between 1 and 3'
    x = gets.chomp.to_i
    if x <= 3 && x >= 1
      x -= 1
      return x
      break
    end
  end
end

# method to check if space is available or not
def available(user, num_row, num_col)
  (user.pick[num_row][num_col]).zero? ? true : false
end

# method to choose the space
space_count = 0
def choose_space(our_user, opposing_user)
  loop do
    puts "it is #{our_user.name}'s turn"
    num_row = prompt("row")
    num_col = prompt("col")

    if available(opposing_user, num_row, num_col)
      our_user.pick[num_row][num_col] = 1
      space_count++
      break
    else
      puts "\n**row #{num_row+1} and column #{num_col+1} are already taken please choose another**\n\n"
    end
  end
end

user1 = User.new(name_user1)
user2 = User.new(name_user2)
