

class CreditCheck

  def valid_number?(card_number)
    card_number_digits = string_to_digit_array(card_number)
    double_digits = double_digits(card_number_digits)
    single_digits = single_digits(double_digits)
    total = make_total(single_digits)
    validity = luhn(total)
  end

  def validation_output(card_number)
    boolean = valid_number?(card_number)
    validity = validity(boolean)
    return "The card number #{card_number} is #{validity}."
  end



  def string_to_digit_array(card_number)
    if card_number.class == String
      card_number_digits = card_number.to_i.digits
    elsif card_number.class == Integer
      card_number_digits = card_number.digits
    end
  end


  def double_digits(card_number_digits)
    doubled_digits = []
    card_number_digits.each.with_index do |digit, index|
      if index % 2 == 1
        doubled_digits << digit * 2
      else
        doubled_digits << digit
      end
    end
    doubled_digits
  end

  def single_digits(doubled_digits)
    single_digits = []
    doubled_digits.each do |number|
      if number > 9
        tens = number / 10
        ones = number % 10
        added_digits = tens + ones
        single_digits << added_digits
      else
        single_digits << number
      end
    end
    single_digits
  end


  def make_total(single_digits)
    total = 0
    single_digits.each do |digit|
      total += digit
    end
   total
  end


  def luhn(total)
    total % 10 == 0
  end

  def validity(luhn_result)
    if luhn_result
      return "valid"
    else
      return "invalid"
    end
  end

  # def check_sum_validation(card_number)
  #   all_digits = string_to_digit_array(card_number)
  #   non_check_numbers = get_noncheck_numbers(all_digits)
  #   noncheck_sum = sum_noncheck_numbers(non_check_numbers)
  #   test_number = get_test_number(noncheck_sum)
  #   check_digit = check_digit(all_digits)
  #   check_digit_compare(test_number, check_digit)
  #
  # end
  #
  #
  # def get_noncheck_numbers(all_digits)
  #   all_digits.shift
  #   return all_digits
  # end
  #
  # def sum_noncheck_numbers(non_check_numbers)
  #   total = 0
  #   non_check_numbers.each do |number|
  #     total += number
  #   end
  #   return total
  # end
  #
  # def get_test_number(noncheck_total)
  #     test_number = (noncheck_total * 9) % 10
  # end
  #
  # def check_digit(all_digits)
  #   all_digits.shift
  # end
  #
  # def check_digit_compare(test_number, check_digit)
  #   if test_number == check_digit
  #     "The check digit of #{check_digit} matches the test number. The card is valid."
  #   else
  #     "The check digit of #{check_digit} does not match the test check digit of #{test_number}."
  #   end
  # end



end
