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

  def check_win
    case
    when pick[0][0] == 1 && pick[0][1] == 1 && pick[0][2] == 1
      true
    when pick[1][0] == 1 && pick[1][1] == 1 && pick[1][2] == 1
      true
    when pick[2][0] == 1 && pick[2][1] == 1 && pick[2][2] == 1
      true
    when pick[0][0] == 1 && pick[1][1] == 1 && pick[2][2] == 1
      true
    when pick[2][0] == 1 && pick[1][1] == 1 && pick[0][2] == 1
      true
    end
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

# global variable to count how many spaces we have
$current_space = 9

# method to choose the space
def choose_space(our_user, opposing_user)
  loop do
    puts "it is #{our_user.name}'s turn"
    num_row = prompt("row")
    num_col = prompt("col")

    if available(opposing_user, num_row, num_col)
      $current_space -= 1
      our_user.pick[num_row][num_col] = 1
      puts "#{our_user.name} chose row #{num_row+1} and column #{num_col+1}"
      break
    else
      puts "\n**row #{num_row+1} and column #{num_col+1} are already taken please choose another**\n\n"
    end
  end
end

# method to display the tic tac toe board
def display(user1, user2)
  string1 = '_|_|_'
  string2 = '_|_|_'
  string3 = '_|_|_'

  #string 1
  case
  when user1.pick[0][0] == 1
    string1[0] = 'x'
  when user2.pick[0][0] == 1
    string1[0] = 'o'
  when user1.pick[0][1] == 1
    string1[2] = 'x'
  when user2.pick[0][1] == 1
    string1[2] = 'o'
  when user1.pick[0][2] == 1
    string1[4] = 'x'
  when user2.pick[0][2] == 1
    string1[4] = 'o'
  end

  #string 2
  case
  when user1.pick[1][0] == 1
    string2[0] = 'x'
  when user2.pick[1][0] == 1
    string2[0] = 'o'
  when user1.pick[1][1] == 1
    string2[2] = 'x'
  when user2.pick[1][1] == 1
    string2[2] = 'o'
  when user1.pick[1][2] == 1
    string2[4] = 'x'
  when user2.pick[1][2] == 1
    string2[4] = 'o'
  end

  #string 3
  case
  when user1.pick[2][0] == 1
    string3[0] = 'x'
  when user2.pick[2][0] == 1
    string3[0] = 'o'
  when user1.pick[2][1] == 1
    string3[2] = 'x'
  when user2.pick[2][1] == 1
    string3[2] = 'o'
  when user1.pick[2][2] == 1
    string3[4] = 'x'
  when user2.pick[2][2] == 1
    string3[4] = 'o'
  end

  puts string1
  puts string2
  puts string3
end

# method to start the game
def start_game(user1, user2)
  num = 0
  loop do
    if $current_space <= 0
      puts "it's a draw"
      break
    elsif user1.check_win
      puts "#{user1.name} is the winner"
      break
    elsif user2.check_win
      puts "#{user2.name} is the winner"
      break
    end

    if num.zero?
      display(user1, user2)
      choose_space(user1, user2)
      num = 1
    else
      display(user1, user2)
      choose_space(user2, user1)
      num = 0
    end
  end
end

user1 = User.new(name_user1)
user2 = User.new(name_user2)

start_game(user1, user2)


