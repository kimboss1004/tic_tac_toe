require 'pry'

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def initialize_board
  b = {}
  (1..9).each {|grid_number| b[grid_number] = ' '}
  b
end

def ask_player_choice(b)
  puts "Where would you like to tac?(1-9)"
  grid_number = gets.chomp.to_i
  b[grid_number] = 'X'
end

def open_spots(board_hash)
 board_hash.select{|k, v| v==' '}.keys
end

def ask_computer_choice(b)
  b[open_spots(b).sample] = 'O'
end

def x_marks(b)
  b.select{|k,v| v == 'X'}.keys
end

def o_marks(b)
  b.select{|k,v| v == 'O'}.keys
end

def check_player(b)
  winning_combos = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[7,5,3]]
  winning_combos.each do |set|
    if x_marks(b).include?(set[0]) && x_marks(b).include?(set[1]) && x_marks(b).include?(set[2])
      return true
    end
  end
  return false
end

def check_computer(b)
  winning_combos = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[7,5,3]]
  winning_combos.each do |set|
    if o_marks(b).include?(set[0]) && o_marks(b).include?(set[1]) && o_marks(b).include?(set[2])
      return true
    end
  end
  return false
end

def cats_game(b)
  if open_spots(b) == []
    return false
  else 
    return true
  end
end



#=================================================

board = initialize_board
winner = false


begin
  draw_board(board)

  ask_player_choice(board)
  player_winner = check_player(board)

  ask_computer_choice(board)
  cp_winner = check_computer(board)

end while(player_winner==false && cp_winner==false && cats_game(board))

draw_board(board)

if(player_winner==true)
  puts "Nice job. You won!"
elsif(cp_winner==true)
  puts "You lost"
else
  puts "Cats game!"
end



