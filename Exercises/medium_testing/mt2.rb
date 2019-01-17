require 'minitest/autorun'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < MiniTest::Test
  def test_change
    transaction = Transaction.new(20)
    register = CashRegister.new(100)
    transaction.amount_paid = 50

    assert_equal(30, register.change(transaction))
  end

  def test_give_receipt
    transaction = Transaction.new(20)
    register = CashRegister.new(100)

    assert_output("You've paid $20.\n") do 
     register.give_receipt(transaction)
    end
  end

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_start_transaction
  end

# this is an interesting one
  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input:input, output:output)
    assert_equal(30, transaction.amount_paid)
  end
end
