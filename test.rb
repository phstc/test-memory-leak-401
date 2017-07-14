require 'shoryuken'

# Test worker for https://github.com/phstc/shoryuken/issues/401
class Test
  include Shoryuken::Worker

  shoryuken_options queue: 'test', auto_delete: true

  def perform(_sqs_msg, count)
    count = count.to_i
    puts "Received: #{count}"

    return if count.zero?

    Test.perform_in(rand(1..300).to_i, (count + 1).to_s)
  end
end
