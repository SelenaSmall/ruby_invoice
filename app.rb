#!/usr/bin/ruby

require_relative './lib/order'
require_relative './lib/handle_input'

command = HandleInput.new(Order.new)

# Read user input
loop do
  $stdout.print "Would you like to LIST available products, SHOP, VIEW basket, EXIT without placing an order? \n"

  input = gets.chomp

  next if input.empty?

  unless 'EXIT'.match?(input)
    command.interpret(input)
    next
  end

  $stdout.print "Goodbye! \n"
  break
end
