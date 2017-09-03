#!/usr/bin/ruby

require_relative './lib/order'
require_relative './lib/handle_input'

command = HandleInput.new(Order.new)

# Read user input
loop do
  $stdout.print "Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT \n"

  input = gets.chomp

  next if input.empty?

  unless 'EXIT'.match?(input)
    command.interpret(input)
    next
  end

  $stdout.print "Goodbye! \n"
  break
end
