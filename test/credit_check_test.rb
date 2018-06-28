require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/credit_check"

class CreditCheckTest < Minitest::Test

  def test_does_it_exist
    credit_check = CreditCheck.new
    assert_instance_of CreditCheck, credit_check
  end

  def test_is_the_number_valid
    credit_check = CreditCheck.new
    assert_equal true, credit_check.valid_number?(5541808923795240)
  end

  def test_is_the_output_valid
    credit_check = CreditCheck.new
    assert_equal "The card number 5541808923795240 is valid.", credit_check.validation_output(5541808923795240)
  end
end
