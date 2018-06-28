

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
end
