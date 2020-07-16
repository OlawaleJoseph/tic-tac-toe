#!/usr/bin/env ruby
require_relative '../lib/game_board.rb'
require_relative '../lib/check_win.rb'
array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
def game_board(array)
  array.length.times do |i|
    print '|'
    array.length.times do |j|
      print " #{array[i][j]} |"
    end
    puts "\n-------------"
  end
end

g_board = Gameboard.new
game_board(array)
check_winner = Checkwin.new
puts 'Welcome to game Tic Tac Toe'
puts 'Player 1 Enter your Name'
player1 = gets.chomp
puts "Welcome #{player1}"
puts 'Player 2 Enter your Name'
player2 = gets.chomp
puts "Welcome #{player2}"
puts "#{player1} start the game"
player_symbol = 'X'
game_chk = false
player_chk = false
move_counter = 0
while game_chk == false

  if player_chk == false
    puts "#{player1} your turn"
    player_chk = true
    player_symbol = 'X'
  else
    puts "#{player2} your turn"
    player_chk = false
    player_symbol = 'O'
  end
  p_move = gets.chomp.to_i
  move = g_board.check_move(p_move)
  while move == false
    move = g_board.check_move(p_move)
    next unless move == false

    game_board(array)
    puts 'Invalid Move! Enter your move from the board'
    p_move = gets.chomp.to_i
  end
  g_board.replace_pos(array, p_move, player_symbol)
  game_board(array)
  game_chk = check_winner.wining_move(array)
  if game_chk == true
    if player_chk == false
      puts "#{player2} you win"
    else
      puts "#{player1} you win"
    end
  end
  move_counter += 1
  if move_counter == 9
    puts 'Game Draw'
    game_chk = true
  end
end
