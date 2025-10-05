# etw_math.rb - Various mathematical formulas for Roblox - Eat the World (ETW)
# Copyright (C) 2025 Lazy Villain
# https://github.com/LazyAntihero/etw_math
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# @author Lazy Villain

# This class contains various methods that perform Eat the World calculations
class EtwMath
  # EtwMath version
  VERSION = "1.0.0"

  # Makes numbers more readable to humans by adding commas
  # @param number [Numeric] Numerical value
  # @param use_decimal [Boolean] Include decimal portion (excluded by default)
  # @return [String] Numerical value represented as a string that may contain commas
  # @example Example without decimal
  #   EtwMath.format_number(1234567.89) # 1,234,567
  # @example Example containing decimal
  #   EtwMath.format_number(1234567.89, true) # 1,234,567.89
  def self.format_number(number, use_decimal = false)
    whole, decimal = number.to_s.split(".")
    num_groups = whole.chars.to_a.reverse.each_slice(3)
    whole_with_commas = num_groups.map(&:join).join(',').reverse
    if use_decimal
      [whole_with_commas, decimal].compact.join(".")
    else
      return whole_with_commas
    end
  end

  # Displays float values with extraneous decimal positions omitted
  # @param value [Numeric] Numerical value
  # @return [String] A float with 2 decimal positions
  # @example
  #   EtwMath.print_decimal(1234.56789) # 1234.56
  def self.print_decimal(value)
    printf('%0.2f', value)
  end

  # Validates numeric input
  # @param inputs [Array] List of numeric inputs
  # @return [Boolean] false if invalid, true otherwise
  # @example
  #   EtwMath.input_valid?(5) # true
  #   EtwMath.input_valid?(5, 200, -1, 's', 0) # false
  def self.input_valid?(*inputs)
    return false if inputs.empty?
    inputs.each do |input|
      return false if !input.is_a?(Numeric)
      return false if input <= 0
    end
    return true
  end

  # Calculates the maximum monetary reward from a brown crate
  # @param size [Integer] Maximum size value
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.brown_crate_max(7000000) # 7,000,000
  def self.brown_crate_max(size)
    return false if !input_valid?(size)
    format_number(size * 1)
  end

  # Calculates the maximum monetary reward from a yellow crate
  # @param size [Integer] Maximum size value
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.yellow_crate_max(7000000) # 14,000,000
  def self.yellow_crate_max(size)
    return false if !input_valid?(size)
    format_number(size * 2)
  end

  # Calculates the maximum monetary reward from a purple crate
  # @param size [Integer] Maximum size value
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.purple_crate_max(7000000) # 21,000,000
  def self.purple_crate_max(size)
    return false if !input_valid?(size)
    format_number(size * 3)
  end

  # Calculates the jackpot reward from a daily spin
  # @param size [Integer] Maximum size value
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.jackpot_amount(7000000) # 35,000,000
  def self.jackpot_amount(size)
    return false if !input_valid?(size)
    format_number(size * 5)
  end

  # Calculates walk speed value
  # @param walk_speed_level [Integer] Walk speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.walk_speed_value(150) # 310
  def self.walk_speed_value(walk_speed_level)
    return false if !input_valid?(walk_speed_level)
    format_number(walk_speed_level * 2 + 10)
  end

  # Calculates walk speed level
  # @param walk_speed_value [Integer] Walk speed value
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.walk_speed_level(300) # 145
  def self.walk_speed_level(walk_speed_value)
    return false if !input_valid?(walk_speed_value)
    begin
      format_number((walk_speed_value - 10) / 2)
    rescue # division by zero
      return false
    end
  end

  # Calculates maximum size
  # @param level [Integer] Maximum size level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.size_at_level(100) # 505,000
  def self.size_at_level(level)
    return false if !input_valid?(level)
    format_number(50 * level ** 2 + 50 * level)
  end

  # Calculates size level
  # @param level [Integer] Maximum size
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.level_at_size(505000) # 100
  def self.level_at_size(size)
    return false if !input_valid?(size)
    begin
      format_number((-50 + Math.sqrt(2500 + 200 * size)) / 100)
    rescue # division by zero
      return false
    end
  end

  # Calculates optimal size level threshold
  # @param multi [Integer] Multiplier level
  # @param ratio [Numeric] Ratio
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.optimal_size_level_threshold(100, 5.5) # 550
  def self.optimal_size_level_threshold(multi, ratio)
    return false if !input_valid?(multi, ratio)
    format_number(multi * ratio)
  end

  # Calculates optimal multiplier
  # @param size_level [Integer] Size level
  # @param ratio [Numeric] Ratio
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.optimal_multi(550, 5.5) # 100
  def self.optimal_multi(size_level, ratio)
    return false if !input_valid?(size_level, ratio)
    begin
      format_number(size_level / ratio)
    rescue # division by zero
      return false
    end
  end

  # Calculates cost of a size level
  # @param size_level [Integer] Size level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.size_level_cost(2) # 80
  def self.size_level_cost(size_level)
    return false if !input_valid?(size_level)
    format_number(10 * size_level ** 3)
  end

  # Calculates cost of a walk speed level
  # @param walk_level [Integer] Walk speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.walk_level_cost(2) # 1,080
  def self.walk_level_cost(walk_level)
    return false if !input_valid?(walk_level)
    format_number(135 * walk_level ** 3)
  end

  # Calculates cost of a multiplier level
  # @param multi_level [Integer] Multiplier level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.multi_level_cost(2) # 40,000
  def self.multi_level_cost(multi_level)
    return false if !input_valid?(multi_level)
    format_number(5000 * multi_level ** 3)
  end

  # Calculates cost of an eat speed level
  # @param eat_level [Numeric] Eat speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.eat_level_cost(2) # 80,000
  def self.eat_level_cost(eat_level)
    return false if !input_valid?(eat_level)
    format_number(10000 * eat_level ** 3)
  end

  # Calculates total cost of size upgrades
  # @param size_level [Integer] Size level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.total_size_investment(10) # 30,240
  def self.total_size_investment(size_level)
    return false if !input_valid?(size_level)
    format_number(5 * (0.5 * size_level ** 4 + size_level ** 3 + 0.5 * size_level ** 2) - 10)
  end

  # Calculates total cost of walk speed upgrades
  # @param walk_level [Integer] Walk speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.total_walk_investment(10) # 408,240
  def self.total_walk_investment(walk_level)
    return false if !input_valid?(walk_level)
    format_number(67.5 * (0.5 * walk_level ** 4 + walk_level ** 3 + 0.5 * walk_level ** 2) - 135)
  end

  # Calculates total cost of multiplier upgrades
  # @param multi_level [Integer] Multiplier level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.total_multi_investment(10) # 15,120,000
  def self.total_multi_investment(multi_level)
    return false if !input_valid?(multi_level)
    format_number(2500 * (0.5 * multi_level ** 4 + multi_level ** 3 + 0.5 * multi_level ** 2) - 5000)
  end

  # Calculates total cost of eat speed upgrades
  # @param eat_level [Integer] Eat speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.total_eat_investment(10) # 30,240,000
  def self.total_eat_investment(eat_level)
    return false if !input_valid?(eat_level)
    format_number(5000 * (0.5 * eat_level ** 4 + eat_level ** 3 + 0.5 * eat_level ** 2) - 10000)
  end

  # Calculates total cost of all upgrades
  # @param size_level [Integer] Size level
  # @param walk_level [Integer] Walk speed level
  # @param multi_level [Integer] Multiplier level
  # @param eat_level [Integer] Eat speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.total_upgrade_investment(83, 10, 15, 11) # 237,475,190
  #   EtwMath.total_upgrade_investment(1000, 400, 200, 75) # 5,474,602,884,855
  def self.total_upgrade_investment(size_level, walk_speed_level, multi, eat_speed_level)
    return false if !input_valid?(size_level, walk_speed_level, multi, eat_speed_level)
    format_number(5 * (0.5 * size_level ** 4 + size_level ** 3 + 0.5 * size_level ** 2) - 10 + 67.5 * (0.5 * walk_speed_level ** 4 + walk_speed_level ** 3 + 0.5 * walk_speed_level ** 2) - 135 + 2500 * (0.5 * multi ** 4 + multi ** 3 + 0.5 * multi ** 2) - 5000 + 5000 * (0.5 * eat_speed_level ** 4 + eat_speed_level ** 3 + 0.5 * eat_speed_level ** 2) - 10000)
  end

  # Calculates size cost using a range from a starting level to an ending level
  # @param starting_level [Integer] Starting size level
  # @param ending_level [Integer] Ending size level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.size_range_cost(5, 10) # 28,000
  def self.size_range_cost(starting_level, ending_level)
    return false if !input_valid?(starting_level, ending_level)
    format_number(5 * (0.5 * ending_level ** 4 + ending_level ** 3 + 0.5 * ending_level ** 2) -5 * (0.5 * starting_level ** 4 + starting_level ** 3 + 0.5 * starting_level ** 2))
  end

  # Calculates walk speed cost using a range from a starting level to an ending level
  # @param starting_level [Integer] Starting walk speed level
  # @param ending_level [Integer] Ending walk speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.walk_range_cost(5, 10) # 378,000
  def self.walk_range_cost(starting_level, ending_level)
    return false if !input_valid?(starting_level, ending_level)
    format_number(67.5 * (0.5 * ending_level ** 4 + ending_level ** 3 + 0.5 * ending_level ** 2) -67.5 * (0.5 * starting_level ** 4 + starting_level ** 3 + 0.5 * starting_level ** 2))
  end

  # Calculates multiplier cost using a range from a starting level to an ending level
  # @param starting_level [Integer] Starting multiplier level
  # @param ending_level [Integer] Ending multiplier level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.multi_range_cost(5, 10) # 14,000,000
  def self.multi_range_cost(starting_level, ending_level)
    return false if !input_valid?(starting_level, ending_level)
    format_number(2500 * (0.5 * ending_level ** 4 + ending_level ** 3 + 0.5 * ending_level ** 2) -2500 * (0.5 * starting_level ** 4 + starting_level ** 3 + 0.5 * starting_level ** 2))
  end

  # Calculates eat speed cost using a range from a starting level to an ending level
  # @param starting_level [Integer] Starting eat speed level
  # @param ending_level [Integer] Ending eat speed level
  # @return [String, Boolean] String representation of an integer or false if input is invalid
  # @example
  #   EtwMath.eat_range_cost(5, 10) # 28,000,000
  def self.eat_range_cost(starting_level, ending_level)
    return false if !input_valid?(starting_level, ending_level)
    format_number(5000 * (0.5 * ending_level ** 4 + ending_level ** 3 + 0.5 * ending_level ** 2) -5000 * (0.5 * starting_level ** 4 + starting_level ** 3 + 0.5 * starting_level ** 2))
  end

  # Calculates small bite amount
  # @param current_size [Integer] Current size
  # @param multi [Integer] Multiplier
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.small_bite_amount(505000, 100) # 20,300
  def self.small_bite_amount(current_size, multi)
    return false if !input_valid?(current_size, multi)
    begin
      format_number(((50 * (((-50 + Math.sqrt(2500 + 200 * current_size)) / 100) + 0.02 * multi) ** 2 + 50 * (((-50 + Math.sqrt(2500 + 200 * current_size)) / 100) + 0.02 * multi)) - current_size).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates medium bite amount
  # @param current_size [Integer] Current size
  # @param multi [Integer] Multiplier
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.medium_bite_amount(505000, 100) # 30,600
  def self.medium_bite_amount(current_size, multi)
    return false if !input_valid?(current_size, multi)
    begin
      format_number(((50 * (((-50 + Math.sqrt(2500 + 200 * current_size)) / 100) + 0.03 * multi) ** 2 + 50 * (((-50 + Math.sqrt(2500 + 200 * current_size)) / 100) + 0.03 * multi)) - current_size).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates big bite amount
  # @param current_size [Integer] Current size
  # @param multi [Integer] Multiplier
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.big_bite_amount(505000, 100) # 41,000
  def self.big_bite_amount(current_size, multi)
    return false if !input_valid?(current_size, multi)
    begin
      format_number(((50 * (((-50 + Math.sqrt(2500 + 200 * current_size)) / 100) + 0.04 * multi) ** 2 + 50 * (((-50 + Math.sqrt(2500 + 200 * current_size)) / 100) + 0.04 * multi)) - current_size).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates multiplier using a starting size and an ending size resulting from a small bite
  # @param starting_size [Integer] Starting size
  # @param ending_size [Integer] Ending size
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.small_bite_delta_multi(9440, 10954) # 53
  def self.small_bite_delta_multi(starting_size, ending_size)
    return false if !input_valid?(starting_size, ending_size)
    begin
      format_number(((((-50 + Math.sqrt(2500 + 200 * ending_size)) / 100) - ((-50 + Math.sqrt(2500 + 200 * starting_size)) / 100)) / 0.02).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates multiplier using a starting size and an ending size resulting from a medium bite
  # @param starting_size [Integer] Starting size
  # @param ending_size [Integer] Ending size
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.medium_bite_delta_multi(9440, 10954) # 35
  def self.medium_bite_delta_multi(starting_size, ending_size)
    return false if !input_valid?(starting_size, ending_size)
    begin
      format_number(((((-50 + Math.sqrt(2500 + 200 * ending_size)) / 100) - ((-50 + Math.sqrt(2500 + 200 * starting_size)) / 100)) / 0.03).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates multiplier using a starting size and an ending size resulting from a big bite
  # @param starting_size [Integer] Starting size
  # @param ending_size [Integer] Ending size
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.big_bite_delta_multi(9440, 10954) # 27
  def self.big_bite_delta_multi(starting_size, ending_size)
    return false if !input_valid?(starting_size, ending_size)
    begin
      format_number(((((-50 + Math.sqrt(2500 + 200 * ending_size)) / 100) - ((-50 + Math.sqrt(2500 + 200 * starting_size)) / 100)) / 0.04).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates multiplier using the first small bite amount
  # @param bite_amount [Integer] Bite amount
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.small_first_bite_multi(270) # 94
  def self.small_first_bite_multi(bite_amount)
    return false if !input_valid?(bite_amount)
    begin
      format_number((((-50 + Math.sqrt(2500 + 200 * bite_amount)) / 100) / 0.02).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates multiplier using the first medium bite amount
  # @param bite_amount [Integer] Bite amount
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.medium_first_bite_multi(270) # 63
  def self.medium_first_bite_multi(bite_amount)
    return false if !input_valid?(bite_amount)
    begin
      format_number((((-50 + Math.sqrt(2500 + 200 * bite_amount)) / 100) / 0.03).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates multiplier using the first big bite amount
  # @param bite_amount [Integer] Bite amount
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.big_first_bite_multi(270) # 47
  def self.big_first_bite_multi(bite_amount)
    return false if !input_valid?(bite_amount)
    begin
      format_number((((-50 + Math.sqrt(2500 + 200 * bite_amount)) / 100) / 0.04).round)
    rescue # division by zero
      return false
    end
  end

  # Calculates time to reach maximum size in minutes for maximum size levels >141
  # @param size_level [Integer] Maximum size level
  # @param multi [Integer] Multiplier
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.time_to_max(565, 101) # 4.82 minutes
  def self.time_to_max(size_level, multi)
    return false if !input_valid?(size_level, multi)
    begin
      format_number((((size_level.to_f / (multi.to_f * 0.03 * 3) * (141.0 / size_level.to_f)) * 3.3 + (size_level.to_f / (multi.to_f * 0.03 * 3.0) * (1 - 141.0 / size_level.to_f)) * 5.1) / 60).round(2), true)
    rescue # division by zero
      return false
    end
  end

  # Calculates time to reach maximum size in minutes for maximum size levels <=141
  # @param size_level [Integer] Maximum size level
  # @param multi [Integer] Multiplier
  # @return [String, Boolean] String representation of an integer or false if input is invalid or division by zero occurs
  # @example
  #   EtwMath.time_to_max_small(140, 31) # 2.75 minutes
  def self.time_to_max_small(size_level, multi)
    return false if !input_valid?(size_level, multi)
    begin
      format_number(((size_level.to_f / multi.to_f / (0.03 * 3) * 3.3 * (0.5 + size_level.to_f / (141 * 2))) / 60).round(2), true)
    rescue # division by zero
      return false
    end
  end
end
