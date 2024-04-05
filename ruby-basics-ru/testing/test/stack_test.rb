# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_stack_push
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'rails'
    stack.push! 'jruby'
    assert(stack) { stack.to_a == %w[ruby rails jruby] }

    stack.pop!
    assert(stack) { stack.to_a == %w[ruby rails] }

    stack.clear!
    assert(stack) { stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
