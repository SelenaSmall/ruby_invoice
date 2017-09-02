require_relative 'item'

# HandleInput class
class HandleInput
  # Actions
  ACTIONS = %w[LIST SHOP VIEW EXIT].freeze

  # Interpret method
  # @param command [String]
  # @return
  def interpret(command)
    return unless ACTIONS.include?(command)

    $stdout.print "#{command} \n"
  end
end
