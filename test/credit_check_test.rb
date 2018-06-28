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

  def test_does_string_change_to_digit_array
    credit_check = CreditCheck.new
    assert_equal [0,4,2,5,9,7,3,2,9,8,0,8,1,4,5,5], credit_check.string_to_digit_array(5541808923795240)
  end

  def test_does_it_double_every_other_digit
    credit_check = CreditCheck.new
    assert_equal [0,8,2,10,9,14,3,4,9,16,0,16,1,8,5,10], credit_check.double_digits([0,4,2,5,9,7,3,2,9,8,0,8,1,4,5,5])
  end

  def test_are_all_digits_single
    credit_check = CreditCheck.new
    assert_equal [0,8,2,1,9,5,3,4,9,7,0,7,1,8,5,1], credit_check.single_digits([0,8,2,10,9,14,3,4,9,16,0,16,1,8,5,10])
  end

  def test_do_the_elements_sum
    credit_check = CreditCheck.new
    expected_total = [0,8,2,1,9,5,3,4,9,7,0,7,1,8,5,1].sum
    assert_equal expected_total, credit_check.make_total([0,8,2,1,9,5,3,4,9,7,0,7,1,8,5,1])
  end

  def test_is_the_luhn_true
    credit_check = CreditCheck.new
    assert_equal true, credit_check.luhn(70)
  end

  def test_is_validity_valid
    credit_check = CreditCheck.new
    assert_equal "valid", credit_check.validity(true)
  end 

end
