#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'

array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
new_array = []
def game_board(array)
  array.length.times do |i|
    print '|'
    array.length.times do |j|
      print " #{array[i][j]} |"
    end
    puts "\n-------------"
  end
end

logic = Gamelogic.new
game_board(array)

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
  move = logic.check_move(p_move, array)
  while move == false
    move = logic.check_move(p_move, array)
    if move == false
      game_board(array)
      puts 'Invalid Move! Enter your move from the board'
      p_move = gets.chomp.to_i
    end
  end
  logic.replace_pos(array, p_move, player_symbol)
  game_board(array)
end

