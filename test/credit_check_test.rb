require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/credit_check"

class CreditCheckTest

  def test_does_it_exist
    credit_check = CreditCheck.new
    assert_instance_of CreditCheck, credit_check
  end

end 
